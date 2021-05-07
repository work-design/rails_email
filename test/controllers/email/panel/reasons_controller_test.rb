require 'test_helper'
class Email::Panel::ReasonsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @email_panel_reason = create email_panel_reasons
  end

  test 'index ok' do
    get panel_reasons_url
    assert_response :success
  end

  test 'new ok' do
    get new_panel_reason_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Reason.count') do
      post panel_reasons_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get panel_reason_url(@email_panel_reason)
    assert_response :success
  end

  test 'edit ok' do
    get edit_panel_reason_url(@email_panel_reason)
    assert_response :success
  end

  test 'update ok' do
    patch panel_reason_url(@email_panel_reason), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Reason.count', -1) do
      delete panel_reason_url(@email_panel_reason)
    end

    assert_response :success
  end

end
