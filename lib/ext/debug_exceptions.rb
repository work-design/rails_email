class ActionDispatch::DebugExceptions

  alias original_render_exception render_exception
  remove_method :render_exception

  def render_exception(env, exception)
    wrapper = ExceptionWrapper.new(env, exception)
    request = Request.new(env)
    post_params = {
      params: request.params,
      exception: wrapper.exception,
      trace: exception.trace,
      line_number: wrapper.line_number,
      file: wrapper.file
    }

    original_render_exception(env, exception)
  end

end
