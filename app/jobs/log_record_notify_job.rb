class LogRecordNotifyJob < ApplicationJob
  queue_as :default

  def perform(log_record)
    log_record.send_message
  end

end
