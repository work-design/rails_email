require 'test_helper'

class Admin::LogCspsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_log_csp = admin_log_csps(:one)
  end

  test "should get index" do
    get admin_log_csps_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_log_csp_url
    assert_response :success
  end

  test "should create admin_log_csp" do
    assert_difference('LogCsp.count') do
      post admin_log_csps_url, params: { admin_log_csp: { blocked_uri: @admin_log_csp.blocked_uri, document_uri: @admin_log_csp.document_uri, original_policy: @admin_log_csp.original_policy, referrer: @admin_log_csp.referrer, violated_directive: @admin_log_csp.violated_directive } }
    end

    assert_redirected_to admin_log_csp_url(LogCsp.last)
  end

  test "should show admin_log_csp" do
    get admin_log_csp_url(@admin_log_csp)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_log_csp_url(@admin_log_csp)
    assert_response :success
  end

  test "should update admin_log_csp" do
    patch admin_log_csp_url(@admin_log_csp), params: { admin_log_csp: { blocked_uri: @admin_log_csp.blocked_uri, document_uri: @admin_log_csp.document_uri, original_policy: @admin_log_csp.original_policy, referrer: @admin_log_csp.referrer, violated_directive: @admin_log_csp.violated_directive } }
    assert_redirected_to admin_log_csp_url(@admin_log_csp)
  end

  test "should destroy admin_log_csp" do
    assert_difference('LogCsp.count', -1) do
      delete admin_log_csp_url(@admin_log_csp)
    end

    assert_redirected_to admin_log_csps_url
  end
end
