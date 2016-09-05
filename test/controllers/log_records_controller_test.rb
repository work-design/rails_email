require 'test_helper'

class LogRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_record = log_records(:one)
  end

  test "should get index" do
    get log_records_url
    assert_response :success
  end

  test "should get new" do
    get new_log_record_url
    assert_response :success
  end

  test "should create log_record" do
    assert_difference('LogRecord.count') do
      post log_records_url, params: { log_record: {  } }
    end

    assert_redirected_to log_record_url(LogRecord.last)
  end

  test "should show log_record" do
    get log_record_url(@log_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_record_url(@log_record)
    assert_response :success
  end

  test "should update log_record" do
    patch log_record_url(@log_record), params: { log_record: {  } }
    assert_redirected_to log_record_url(@log_record)
  end

  test "should destroy log_record" do
    assert_difference('LogRecord.count', -1) do
      delete log_record_url(@log_record)
    end

    assert_redirected_to log_records_url
  end
end
