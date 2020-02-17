require 'test_helper'
class Logged::Admin::LogCspsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @log_csp = create :log_csp
  end

  test 'index ok' do
    get admin_log_csps_url
    assert_response :success
  end

  test 'show ok' do
    get admin_log_csp_url(@log_csp), xhr: true
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('LogCsp.count', -1) do
      delete admin_log_csp_url(@log_csp), xhr: true
    end

    assert_response :success
  end
end
