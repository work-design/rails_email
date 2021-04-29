module Email
  class Panel::LogsController < Panel::BaseController
    before_action :set_log, only: [:show, :destroy]

    def index
      q_params = {}
      q_params.merge! params.permit(:mailer, :action_name, :mail_to)

      @logs = Log.default_where(q_params).page(params[:page])
    end

    def show
    end

    def destroy
      @log.destroy
    end

    private
    def set_log
      @log = Log.find(params[:id])
    end

  end
end
