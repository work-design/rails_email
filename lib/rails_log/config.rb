require 'active_support/configurable'

module RailsLog
  include ActiveSupport::Configurable

  configure do |config|
    config.ignore_exception = [
      'ActionController::UnknownFormat'
    ]
    config.constraint = -> (req){ User.find_by(id: req.env['rack.session']['user_id'])&.admin? if req.env['rack.session'].present? }
  end

end