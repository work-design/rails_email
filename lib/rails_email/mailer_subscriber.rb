module RailsEmail
  class MailerSubscriber < ActiveSupport::LogSubscriber

    def record(event)
      payload = event.payload

      log = Email::Log.new(message_object_id: payload[:message_object_id], mailer: payload[:mailer])
      log.action_name = payload[:action_name]
      log.params = payload[:params]
      log.save

      info '  -----> mailer log saved!'
    end

    def deliver(event)
      payload = event.payload

      log = Email::Log.find_or_initialize_by(message_object_id: payload[:message_object_id], mailer: payload[:mailer])
      log.subject = payload[:subject]
      log.mail_from = payload[:from][0]
      log.sent_status = payload[:sent_status]
      log.sent_string = payload[:sent_string]
      log.mail_to = payload[:mail_to]
      log.cc_to = payload[:cc_to]
      log.save

      info '  -----> mailer log updated!'
    end

    self.attach_to :action_mailer
  end
end
