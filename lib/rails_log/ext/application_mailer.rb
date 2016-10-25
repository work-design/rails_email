class ApplicationMailer < ActionMailer::Base

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

  def self.deliver_mail(mail)
    ActiveSupport::Notifications.instrument('deliver.action_mailer') do |payload|
      set_payload_for_mail(payload, mail)
      payload[:message_object_id] = mail.object_id

      result = yield

      if result.is_a? Net::SMTP::Response
        payload[:sent_status] = result.status
        payload[:sent_string] = result.string
      end
    end
  end

end
