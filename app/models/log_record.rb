class LogRecord < ApplicationRecord
  serialize :params, Hash
  serialize :cookie, Hash
  serialize :session, Hash
  serialize :headers, Hash


end
