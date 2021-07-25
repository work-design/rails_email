ENV['RAILS_ENV'] = 'test'
require_relative 'dummy/config/environment'
require 'rails/test_help'
require 'minitest/mock'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

class ActiveSupport::TestCase
  self.fixture_path = File.expand_path('fixtures', __dir__)
  self.file_fixture_path = fixture_path + '/files'
  ActionDispatch::IntegrationTest.fixture_path = self.fixture_path
  fixtures :all
  #parallelize(workers: :number_of_processors)
end
