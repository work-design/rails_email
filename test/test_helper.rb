ENV['RAILS_ENV'] = 'test'
require_relative 'dummy/config/environment'
require 'rails/test_help'
require 'minitest/mock'
require 'factory_bot'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
FactoryBot.find_definitions

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end
