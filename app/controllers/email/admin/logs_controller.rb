module Email
  class Admin::LogsController < Admin::BaseController
    before_action :set_log, only: [:show, :edit, :update, :destroy]

    def index
      @logs = Log.page(params[:page])
    end

    def new
      @log = Log.new
    end

    def create
      @log = Log.new(log_params)

      unless @log.save
        render :new, locals: { model: @log }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @log.assign_attributes(log_params)

      unless @log.save
        render :edit, locals: { model: @log }, status: :unprocessable_entity
      end
    end

    def destroy
      @log.destroy
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
