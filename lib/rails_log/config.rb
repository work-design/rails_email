require 'active_support/configurable'

module RailsLog
  include ActiveSupport::Configurable

  configure do |config|
    config.admin_controller = 'AdminController'
    config.ignore_exception = [
      'ActionController::UnknownFormat',
      'ActiveRecord::RecordNotFound'
    ]
    config.quiet_logs = true
    config.intercept_not_found = true
    config.disable_debug = true
    config.notify_bot = 'WorkWechatBot'
    config.notify_key = ''
    config.not_found_logger = ActiveSupport::Logger.new('log/not_found.log')
  end

end
