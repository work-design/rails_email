class LogMailer < ApplicationRecord
  include RailsLog::LogMailer
end unless defined? LogMailer
