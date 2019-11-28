module RailsLog::LogMailer
  extend ActiveSupport::Concern
  included do
    attribute :message_object_id, :string
    attribute :mailer, :string
    attribute :action_name, :string
    attribute :params, :string
    attribute :subject, :string
    attribute :mail_to, :string
    attribute :cc_to, :string
    attribute :sent_status, :string
    attribute :sent_string, :string
    
    default_scope -> { order(id: :desc) }
  end
  
end
