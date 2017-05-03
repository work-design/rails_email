module RailsLog
  class Engine < ::Rails::Engine

    initializer 'rails_log.assets.precompile' do |app|
      app.config.assets.precompile += ['rails_log_manifest.js']
      ApplicationMailer.include MailerRecord
    end

    initializer 'rails_log.add_assets_templates' do |app|
      app.config.assets.paths.push *Dir[File.expand_path('lib/nondigest_assets/*', root)]
    end

  end
end
