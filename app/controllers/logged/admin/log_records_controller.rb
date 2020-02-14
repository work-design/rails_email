class Logged::Admin::LogRecordsController < Logged::Admin::BaseController
  before_action :set_log_record, only: [:show, :destroy]

  def index
    q_params = {}
    q_params.merge! params.permit('controller_name', 'action_name', 'path-like', 'exception_object')
    @log_records = LogRecord.default_where(q_params).page(params[:page]).per(params[:per])
  end

  def show
  end

  def destroy
    @log_record.destroy
  end

  private
  def set_log_record
    @log_record = LogRecord.find(params[:id])
  end

end
