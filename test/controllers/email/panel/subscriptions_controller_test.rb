require 'test_helper'
class Email::Panel::SubscriptionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @email_panel_subscription = create email_panel_subscriptions
  end

  test 'index ok' do
    get panel_subscriptions_url
    assert_response :success
  end

  test 'new ok' do
    get new_panel_subscription_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Subscription.count') do
      post panel_subscriptions_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get panel_subscription_url(@email_panel_subscription)
    assert_response :success
  end

  test 'edit ok' do
    get edit_panel_subscription_url(@email_panel_subscription)
    assert_response :success
  end

  test 'update ok' do
    patch panel_subscription_url(@email_panel_subscription), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Subscription.count', -1) do
      delete panel_subscription_url(@email_panel_subscription)
    end

    assert_response :success
  end

end
