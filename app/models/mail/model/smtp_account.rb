module Mail
  module Model::SmtpAccount
    extend ActiveSupport::Concern

    included do
      attribute :user_name, :string
      attribute :password, :string

      belongs_to :smtp
    end


  end
end
