class Log::Admin::LogMailersController < Log::Admin::BaseController
  before_action :set_log_mailer, only: [:show, :destroy]

  def index
    @log_mailers = LogMailer.default_where(q_params).page(params[:page])
  end

  def show
  end

  def destroy
    @log_mailer.destroy
    redirect_to admin_log_mailers_url, notice: 'Log record was successfully destroyed.'
  end

  private
  def set_log_mailer
    @log_mailer = LogMailer.find(params[:id])
  end

  def q_params
    params.fetch(:q, {}).permit!
  end

end
