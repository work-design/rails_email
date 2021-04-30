module Email
  module Subscription
    extend ActiveSupport::Concern

    included do
      attribute :address, :string
      attribute :subscribe_at, :datetime
      attribute :unsubscribe_at, :datetime

      enum state: {
        init: 'init',
        subscribed: 'subscribed',
        unsubscribed: 'unsubscribed'
      }, _default: 'init'

      belongs_to :smtp, optional: true
      belongs_to :smtp_account, optional: true
    end

  end
end
