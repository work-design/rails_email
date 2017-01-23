module RailsLog
  class Engine < ::Rails::Engine

    initializer 'rails_log.assets.precompile' do |app|
      app.config.assets.precompile += ['rails_log_manifest.js']
      ApplicationMailer.include MailerRecord
    end

  end
end
