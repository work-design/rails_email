class LogRecord < ApplicationRecord
  include RailsLog::LogRecord
end unless defined? LogRecord
