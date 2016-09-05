module RailsLog
  class LogSubscriber < ActiveSupport::LogSubscriber

    def header_processing(event)
      return unless logger.debug?

      payload = event.payload
      headers  = request_headers(payload[:env])

      debug "  Headers: #{headers.inspect}"
    end

    def process_action(event)
      payload = event.payload
      if payload[:exception].present?
        lc = LogRecord.new
        lc.controller = payload[:controller]
        lc.action = payload[:action]
        lc.params = payload[:params].except('controller', 'action')
        lc.headers = request_headers payload[:headers].to_h
        lc.exception = payload[:exception].join('\n')
        lc.exception_object = payload[:exception_object].class.to_s
        lc.exception_backtrace = payload[:exception_object].backtrace.join('\n')
        lc.save
        info 'exception log saved!'
      end
    end

    def logger
      ActionController::Base.logger
    end

    def request_headers(env)
      result = env.select { |k, _| k.start_with? 'HTTP_' }
      #result.delete 'HTTP_COOKIE'
      result = result.collect { |pair| [pair[0].sub(/^HTTP_/, ''), pair[1]] }
      result.sort.to_h
    end

  end
end

RailsLog::LogSubscriber.attach_to :action_controller