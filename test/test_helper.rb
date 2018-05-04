ENV['RAILS_ENV'] ||= 'test'
require_relative '../test/dummy/config/environment'
require 'rails/test_help'
require 'minitest/mock'

ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

if defined?(FactoryBot)
  FactoryBot.definition_file_paths << RailsLog::Engine.root.join('test/factories')
  FactoryBot.find_definitions
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end