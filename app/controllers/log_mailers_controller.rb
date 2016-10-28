class LogMailersController < ApplicationController
  layout 'rails_log/application'
  before_action :set_log_mailer, only: [:show, :destroy]

  def index
    @log_mailers = LogMailer.page(params[:page])
  end

  def show
  end

  def destroy
    @log_mailer.destroy
    redirect_to log_mailers_url, notice: 'Log record was successfully destroyed.'
  end

  private
  def set_log_mailer
    @log_mailer = LogMailer.find(params[:id])
  end

end
