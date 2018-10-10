require 'default_form'
require 'default_where'

module RailsLog
  mattr_accessor :not_found_logger
  self.not_found_logger = ActiveSupport::Logger.new('log/not_found.log')

  class Engine < ::Rails::Engine # :nodoc:

    config.eager_load_paths += Dir[
      "#{config.root}/app/models/rails_log"
    ]

    initializer 'rails_log.assets.precompile' do |app|
      app.config.assets.precompile += ['rails_log_manifest.js']
      ApplicationMailer.include MailerRecord
    end

    initializer 'rails_log.add_assets_templates' do |app|
      app.config.assets.paths.push *Dir[File.expand_path('lib/nondigest_assets/*', root)]
    end

    initializer 'rails_log.quiet_logs' do |app|
      if RailsLog.config.quiet_logs
        app.middleware.insert_before ::Rails::Rack::Logger, ::RailsLog::QuietLogs
      end
    end

  end
end
