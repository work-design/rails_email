require 'test_helper'

class RailsLog::LogRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_record = create :log_record
  end

  test 'should get index' do
    get admin_log_records_url
    assert_response :success
  end

  test 'should show log_record' do
    get admin_log_record_url(@log_record)
    assert_response :success
  end


  test "should destroy log_record" do
    assert_difference('LogRecord.count', -1) do
      delete admin_log_record_url(@log_record)
    end

    assert_redirected_to admin_log_records_url
  end
end
