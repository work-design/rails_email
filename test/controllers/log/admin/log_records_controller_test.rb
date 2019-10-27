require 'test_helper'
class Log::Admin::LogRecordsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @log_record = create :log_record
  end

  test 'index ok' do
    get admin_log_records_url
    assert_response :success
  end

  test 'show ok' do
    get admin_log_record_url(@log_record), xhr: true
    assert_response :success
  end
  
  test 'destroy ok' do
    assert_difference('LogRecord.count', -1) do
      delete admin_log_record_url(@log_record), xhr: true
    end

    assert_response :success
  end
  
end
