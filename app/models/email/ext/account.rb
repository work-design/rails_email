module Email
  module Ext::Account
    extend ActiveSupport::Concern

    included do
      has_one :subscription, foreign_key: :address, primary_key: :identity
    end

  end
end
