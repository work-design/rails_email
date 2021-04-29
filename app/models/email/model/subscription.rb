module Email
  module Subscription
    extend ActiveSupport::Concern

    included do
      attribute :address, :string
      attribute :unsubscribe_at, :datetime

      enum state: {
        init: 'init',
        subscribed: 'subscribed',
        unsubscribed: 'unsubscribed'
      }, _default: 'init'
    end

  end
end
