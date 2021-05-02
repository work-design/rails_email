module Email
  module Model::SmtpAccount
    extend ActiveSupport::Concern

    included do
      attribute :user_name, :string
      attribute :password, :string
      attribute :position, :integer, index: true

      belongs_to :smtp
    end


  end
end
