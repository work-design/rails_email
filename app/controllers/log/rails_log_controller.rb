class Log::RailsLogController < ApplicationController

  def not_found
    params.permit!
    RailsLog.not_found_logger.info "#{params[:path]}.#{params[:format]}"

    head :not_found
  end

  def index
    path = Rails.root + RailsLog.not_found_logger.instance_variable_get(:@logdev).filename
    result = `tail -n200 #{path}`

    render plain: result
  end

end
