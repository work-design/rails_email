class Log::Api::RailsLogController < RailsLog.config.api_class.constantize

  def not_found
    params.permit!
    RailsLog.not_found_logger.info "#{params[:path]}.#{params[:format]}"

    head :not_found
  end

end
