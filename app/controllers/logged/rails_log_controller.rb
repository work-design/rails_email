module Logged
  class RailsLogController < BaseController
    skip_before_action :verify_authenticity_token

    def not_found
      params.permit!
      RailsLog.config.not_found_logger.info "#{params[:path]}.#{params[:format]}"

      head :not_found
    end

    def csp
      data = JSON.parse(request.body.read)
      p = data.fetch('csp-report', {})
      p.transform_keys!(&:underscore)

      LogCsp.create(p)

      head :no_content
    end

    def index
      path = Rails.root + RailsLog.config.not_found_logger.instance_variable_get(:@logdev).filename
      result = `tail -n200 #{path}`

      render plain: result
    end

  end
end
