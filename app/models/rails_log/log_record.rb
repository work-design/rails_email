class LogRecord < ApplicationRecord
  serialize :params, Hash
  serialize :cookie, Hash
  serialize :session, Hash
  serialize :headers, Hash

  default_scope -> { order(id: :desc) }

end
