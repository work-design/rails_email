module Logged
  class Panel::LogMailersController < Panel::BaseController
    before_action :set_log_mailer, only: [:show, :destroy]

    def index
      q_params = {}
      q_params.merge! params.permit(:mailer, :action_name, :mail_to)
      @log_mailers = LogMailer.default_where(q_params).page(params[:page])
    end

    def show
    end

    def destroy
      @log_mailer.destroy
    end

    private
    def set_log_mailer
      @log_mailer = LogMailer.find(params[:id])
    end

  end
end
