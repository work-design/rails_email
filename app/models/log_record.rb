class LogRecord < ApplicationRecord
  serialize :params, Hash
  serialize :headers, Hash


end
