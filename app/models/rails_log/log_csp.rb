class LogCsp < ApplicationRecord

  default_scope -> { order(id: :desc) }

end
