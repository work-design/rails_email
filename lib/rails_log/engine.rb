require 'rails_com'

class RailsLog::Engine < ::Rails::Engine # :nodoc:

  config.generators do |g|
    g.rails = {
      assets: false,
      stylesheets: false,
      helper: false
    }
    g.test_unit = {
      fixture: true,
      fixture_replacement: :factory_bot
    }
    g.templates.unshift File.expand_path('lib/templates', RailsCom::Engine.root)
  end

  initializer 'rails_log.quiet_logs' do |app|
    if RailsLog.config.quiet_logs
      #app.middleware.insert_before ::Rails::Rack::Logger, ::RailsLog::QuietLogs
    end
  end

end
