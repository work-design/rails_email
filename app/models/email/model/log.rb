module Email
  module Model::Log
    extend ActiveSupport::Concern

    included do
      attribute :mail_from, :string
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

      belongs_to :template, optional: true
      belongs_to :smtp_account, foreign_key: :mail_from, primary_key: :user_name, optional: true
    end

  end
end
