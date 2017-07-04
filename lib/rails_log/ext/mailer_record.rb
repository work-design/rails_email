module MailerRecord
  extend ActiveSupport::Concern

  def process(method_name, *args)
    payload = {
      mailer: self.class.name,
      action: method_name,
      message_object_id: self.message.object_id,
      params: args
    }

    ActiveSupport::Notifications.instrument('record.action_mailer', payload)

    super
  end

  module ClassMethods
    def deliver_mail(mail)
      ActiveSupport::Notifications.instrument('deliver.action_mailer') do |payload|
        set_payload_for_mail(payload, mail)
        payload[:message_object_id] = mail.object_id
        payload[:mail_to] = mail.to.join(', ')
        payload[:cc_to] = mail.cc.to_a.join(', ')

        result = yield

        if result.is_a? Net::SMTP::Response
          payload[:sent_status] = result.status
          payload[:sent_string] = result.string
        end
      end
    end
  end

end
