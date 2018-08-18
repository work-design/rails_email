require 'test_helper'

class LogRecordTest < ActiveSupport::TestCase
  setup do
    @log_record = create :log_record
  end

  test 'create log record' do
    assert_kind_of LogRecord, @log_record
  end

end
