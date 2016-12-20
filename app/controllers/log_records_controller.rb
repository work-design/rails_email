class LogRecordsController < ApplicationController
  layout 'rails_log/application'
  before_action :set_log_record, only: [:show, :destroy]

  def index
    @log_records = LogRecord.default_where(params[:q]).page(params[:page])
  end

  def show
  end

  def destroy
    @log_record.destroy
    redirect_to log_records_url, notice: 'Log record was successfully destroyed.'
  end

  private
  def set_log_record
    @log_record = LogRecord.find(params[:id])
  end

end
