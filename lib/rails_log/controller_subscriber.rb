module RailsLog
  class ControllerSubscriber < ActiveSupport::LogSubscriber

    def start_processing(event)
      return unless logger.debug?
      payload = event.payload
      raw_headers = payload.fetch(:headers, {})
      headers = ::LogRecord.request_headers(raw_headers)

      debug "  Headers: #{headers.inspect}"
    end

    def process_action(event)
      payload = event.payload

      return if payload[:exception_object].blank?
      return if RailsLog.config.ignore_exception.include?(payload[:exception_object].class.to_s)
      return unless Rails.env.development? && RailsLog.config.debug

      record_to_log(payload)
    end

    def record_to_log(payload)
      headers = payload.fetch(:headers, {})

      lc = ::LogRecord.new
      lc.path = payload[:path]
      lc.controller = payload[:controller]
      lc.action = payload[:action]
      lc.params = ::LogRecord.filter_params(payload[:params])
      lc.headers = ::LogRecord.request_headers(headers)
      lc.cookie = headers['rack.request.cookie_hash']
      lc.session = Hash.new(headers['rack.session'])
      lc.exception = payload[:exception].join("\r\n")[0..columns_limit['exception']]
      lc.exception_object = payload[:exception_object].class.to_s
      lc.exception_backtrace = payload[:exception_object].backtrace.join("\r\n")[0..columns_limit['exception_backtrace']]
      lc.save
      logger.info 'exception log saved!'
    end

    def logger
      ActionController::Base.logger
    end

    def columns_limit
      ::LogRecord.columns_limit
    end

  end
end

RailsLog::ControllerSubscriber.attach_to :action_controller
