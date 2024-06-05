require 'rails_com'

class RailsEmail::Engine < ::Rails::Engine # :nodoc:

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

  initializer 'rails_email.action_mailers.preview' do |app|
    app.config.action_mailer.preview_paths << config.root.join('test/mailers/previews')
  end

end
