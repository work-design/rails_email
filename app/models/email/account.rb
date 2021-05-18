module Email
  class Account < ApplicationRecord
    include Model::Account
    self.table_name = 'auth_accounts'
    self.inheritance_column = nil
  end
end
