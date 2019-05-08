class Log::Admin::LogCspsController < Log::Admin::BaseController
  before_action :set_log_csp, only: [:show, :edit]

  def index
    q_params = params.fetch(:q, {}).permit!
    @log_csps = LogCsp.default_where(q_params).page(params[:page])
  end

  def show
  end

  def destroy
    @log_csp.destroy
    redirect_to admin_log_csps_url
  end

  private
  def set_log_csp
    @log_csp = LogCsp.find(params[:id])
  end

end
