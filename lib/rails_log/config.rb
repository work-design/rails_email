require 'active_support/configurable'

module RailsLog
  include ActiveSupport::Configurable

  configure do |config|
    config.admin_controller = 'AdminController'
    config.ignore_exception = [
      'ActionController::UnknownFormat'
    ]
    config.quiet_logs = true
    config.intercept_not_found = true
    config.disable_debug = true
    config.notify_url = 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send'
  end

end
