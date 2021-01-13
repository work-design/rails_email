module Logged
  class LogRecord < ApplicationRecord
    include Model::LogRecord
  end
end
