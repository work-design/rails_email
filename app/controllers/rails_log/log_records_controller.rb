class RailsLog::LogRecordsController < RailsLog::BaseController
  before_action :set_log_record, only: [:show, :destroy]

  def index
    @log_records = LogRecord.default_where(q_params).page(params[:page]).per(params[:per])
  end

  def show
  end

  def destroy
    @log_record.destroy
    redirect_to admin_log_records_url, notice: 'Log record was successfully destroyed.'
  end

  private
  def set_log_record
    @log_record = LogRecord.find(params[:id])
  end

  def q_params
    params.fetch(:q, {}).permit!
  end

end
