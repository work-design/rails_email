class LogRecord < ApplicationRecord
  serialize :params, Hash
  serialize :cookie, Hash
  serialize :session, Hash
  serialize :headers, Hash

  default_scope -> { order(id: :desc) }



  def record_to_log(controller, exp)
    request = controller.request
    headers = request.headers

    lc = ::LogRecord.new
    lc.path = request.fullpath
    lc.controller = controller.class.name
    lc.action = controller.action_name
    lc.params = filter_params(request.filtered_parameters)
    lc.headers = request_headers(request.headers)
    lc.cookie = headers['rack.request.cookie_hash']
    lc.session = Hash.new(headers['rack.session'])
    lc.exception = [exp.class.name, exp.message].join("\r\n")
    lc.exception_object = exp.class.to_s

    limit = ::LogRecord.columns_hash['exception_backtrace'].limit
    if limit
      lc.exception_backtrace = exp.backtrace&.join("\r\n")&.truncate(limit)
    else
      lc.exception_backtrace = exp.backtrace&.join("\r\n")
    end

    lc.save
    info 'exception log saved!'
  end

end
