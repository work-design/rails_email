module RailsEmail::MailerRecord

  def self.prepended(mod)
    def mod.deliver_mail(mail)
      ActiveSupport::Notifications.instrument('deliver.action_mailer') do |payload|
        set_payload_for_mail(payload, mail)
        payload[:message_object_id] = mail.object_id
        payload[:subject] = mail.subject
        payload[:mail_to] = Array(mail.to).join(', ')
        payload[:cc_to] = Array(mail.cc).join(', ')

        result = yield

        if result.is_a? Net::SMTP::Response
          payload[:sent_status] = result.status
          payload[:sent_string] = result.string
        end
      end
    end
  end

  def process(method_name, *args)
    payload = {
      mailer: self.class.name,
      action_name: method_name,
      message_object_id: self.message.object_id,
      params: args.map { |i| i.respond_to?(:to_gid) ? i.to_gid : i }
    }

    ActiveSupport::Notifications.instrument('record.action_mailer', payload)

    super
  end

end

ActiveSupport.on_load :action_mailer do
  prepend RailsEmail::MailerRecord
end
