module Email
  class Account < ApplicationRecord
    include Model::Account

    self.table_name = 'accounts'
    self.inheritance_column = nil
  end
end
