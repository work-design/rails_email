module Email
  class Account < ApplicationRecord
    include Model::Account
    include Auth::Model::Account if defined? RailsAuth
    self.table_name = 'auth_accounts'
    self.inheritance_column = nil
  end
end
