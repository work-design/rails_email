require 'active_support/configurable'

module RailsLog
  include ActiveSupport::Configurable

  configure do |config|
    config.ignore_exception = [
      'ActionController::UnknownFormat'
    ]
  end

end