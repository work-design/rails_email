module Email
  module Model::SmtpAccount
    extend ActiveSupport::Concern

    included do
      attribute :user_name, :string
      attribute :password, :string
      attribute :position, :integer, index: true

      belongs_to :smtp

      acts_as_list top_of_list: 0
    end


  end
end
