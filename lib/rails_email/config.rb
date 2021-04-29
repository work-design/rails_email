require 'active_support/configurable'

module RailsEmail
  include ActiveSupport::Configurable

  configure do |config|
    config.intercept_not_found = true
  end

end
