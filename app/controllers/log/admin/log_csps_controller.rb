class Log::Admin::LogCspsController < Log::Admin::BaseController
  before_action :set_log_csp, only: [:show, :destroy]

  def index
    q_params = {}
    q_params.merge! params.permit(:document_uri)
    @log_csps = LogCsp.default_where(q_params).page(params[:page])
  end

  def show
  end

  def destroy
    @log_csp.destroy
  end

  private
  def set_log_csp
    @log_csp = LogCsp.find(params[:id])
  end

end
