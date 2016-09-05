module RailsLog::DebugExceptions

  def render_exception(env, exception)

    {
      env: env,
      ex: exception.backtrace
    }

    super
  end

end

ActionDispatch::DebugExceptions.prepend RailsLog::DebugExceptions