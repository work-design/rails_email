module Email
  module Model::Reason
    extend ActiveSupport::Concern

    included do
      attribute :body, :string

      has_many :subscriptions
    end

  end
end
