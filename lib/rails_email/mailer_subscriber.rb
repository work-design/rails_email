module RailsLog
  class MailerSubscriber < ActiveSupport::LogSubscriber

    def record(event)
      payload = event.payload

      log_mailer = Logged::LogMailer.new(message_object_id: payload[:message_object_id], mailer: payload[:mailer])
      log_mailer.action_name = payload[:action_name]
      log_mailer.params = payload[:params]
      log_mailer.save

      info 'mailer log saved!'
    end

    def deliver(event)
      payload = event.payload

      log_mailer = Logged::LogMailer.find_or_initialize_by(message_object_id: payload[:message_object_id], mailer: payload[:mailer])
      log_mailer.subject = payload[:subject]
      log_mailer.sent_status = payload[:sent_status]
      log_mailer.sent_string = payload[:sent_string]
      log_mailer.mail_to = payload[:mail_to]
      log_mailer.cc_to = payload[:cc_to]
      log_mailer.save

      info 'mailer log updated!'
    end

  end
end

RailsLog::MailerSubscriber.attach_to :action_mailer
