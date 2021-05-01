require 'test_helper'
class Email::SubscriptionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @email_subscription = create email_subscriptions
  end

  test 'index ok' do
    get email_subscriptions_url
    assert_response :success
  end

  test 'new ok' do
    get new_email_subscription_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Subscription.count') do
      post email_subscriptions_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get email_subscription_url(@email_subscription)
    assert_response :success
  end

  test 'edit ok' do
    get edit_email_subscription_url(@email_subscription)
    assert_response :success
  end

  test 'update ok' do
    patch email_subscription_url(@email_subscription), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Subscription.count', -1) do
      delete email_subscription_url(@email_subscription)
    end

    assert_response :success
  end

end
