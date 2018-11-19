module RailsLog
  class ControllerSubscriber < ActiveSupport::LogSubscriber

    def start_processing(event)
      return unless logger.debug?
      payload = event.payload
      raw_headers = payload.fetch(:headers, {})
      headers = request_headers(raw_headers)

      debug "  Headers: #{headers.inspect}"
    end

    def process_action(event)
      payload = event.payload
      headers = payload.fetch(:headers, {})

      if payload[:exception].present? && !Rails.env.development?
        unless RailsLog.config.ignore_exception.include? payload[:exception_object].class.to_s
          lc = LogRecord.new
          lc.path = payload[:path]
          lc.controller = payload[:controller]
          lc.action = payload[:action]
          lc.params = filter_params(payload[:params])
          lc.headers = request_headers headers
          lc.cookie = headers['rack.request.cookie_hash']
          lc.session = Hash.new(headers['rack.session'])
          lc.exception = payload[:exception].join("\r\n")
          lc.exception_object = payload[:exception_object].class.to_s

          limit = LogRecord.columns_hash['exception_backtrace'].limit
          if limit
            lc.exception_backtrace = payload[:exception_object]&.backtrace&.join("\r\n")&.truncate(limit)
          else
            lc.exception_backtrace = payload[:exception_object]&.backtrace&.join("\r\n")
          end

          lc.save
          info 'exception log saved!'
        end
      end
    end

    def logger
      ActionController::Base.logger
    end

    def request_headers(headers)
      result = headers.select { |k, _| k.start_with?('HTTP_') && k != 'HTTP_COOKIE' }
      result = result.collect { |pair| [pair[0].sub(/^HTTP_/, ''), pair[1]] }
      result.sort.to_h
    end

    def filter_params(params)
      filter_keys = ['controller', 'action']
      params.deep_transform_values { |v| v.to_s }.except(*filter_keys)
    end

  end
end

RailsLog::ControllerSubscriber.attach_to :action_controller
