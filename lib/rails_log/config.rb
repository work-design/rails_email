require 'active_support/configurable'

module RailsLog
  include ActiveSupport::Configurable

  configure do |config|
    config.ignore_exception = [
      'ActionController::UnknownFormat'
    ]
    config.admin_class = 'AdminController'
    config.quiet_logs = true
    config.intercept_not_found = true
  end

end
