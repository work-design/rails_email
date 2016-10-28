class LogMailer < ApplicationRecord
  default_scope -> { order(id: :desc) }

end
