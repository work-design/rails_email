require 'test_helper'
class Email::Admin::LogsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @email_admin_log = create email_admin_logs
  end

  test 'index ok' do
    get admin_logs_url
    assert_response :success
  end

  test 'new ok' do
    get new_admin_log_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Log.count') do
      post admin_logs_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get admin_log_url(@email_admin_log)
    assert_response :success
  end

  test 'edit ok' do
    get edit_admin_log_url(@email_admin_log)
    assert_response :success
  end

  test 'update ok' do
    patch admin_log_url(@email_admin_log), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Log.count', -1) do
      delete admin_log_url(@email_admin_log)
    end

    assert_response :success
  end

end
