module Email
  class Admin::LogsController < Admin::BaseController
    before_action :set_log, only: [:show, :edit, :update, :destroy]

    def index
      @logs = Log.page(params[:page])
    end

    private
    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.fetch(:log, {}).permit(
        :mail_from,
        :mail_to,
        :sent_status,
        :sent_result,
        :created_at
      )
    end

  end
end
