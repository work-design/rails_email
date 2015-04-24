module RailsLog
  class LogSubscriber < ActiveSupport::LogSubscriber

    RESPONSE_FORMAT = %{response: %s  used: %ss\nheaders: %s\nbody-length: %s body: %s}
    ERROR_FORMAT = %{  error: %s\n%s}

    def header_processing(event)
      return unless logger.debug?

      payload = event.payload
      headers  = request_headers(payload[:env])

      debug "  Headers: #{headers.inspect}"
    end

    def request_headers(env)
      result = env.select { |k, v| k.start_with? 'HTTP_' }
      result.delete 'HTTP_COOKIE'
      result = result.collect { |pair| [pair[0].sub(/^HTTP_/, ''), pair[1]] }
      result.sort.to_h
    end

  end
end

RailsLog::LogSubscriber.attach_to :action_controller