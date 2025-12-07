module RailsEmail
  mattr_accessor :config, default: ActiveSupport::OrderedOptions.new

  config.intercept_not_found = true

end
