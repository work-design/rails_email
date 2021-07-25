require 'test_helper'
module Email
  class SubscriptionsControllerTest < ActionDispatch::IntegrationTest

    setup do
      @subscription = email_subscriptions(:one)
      account = Auth::Account.find_by(identity: 'test@work.design')
      @auth_token = account.authorized_token.token
    end

    test 'new ok' do
      get url_for(controller: 'email/subscriptions', action: 'new'), params: { auth_token: @auth_token }
      assert_response :success
    end

    test 'create ok' do
      assert_difference('Email::Subscription.count') do
        post(
          url_for(controller: 'email/subscriptions', action: 'create'),
          params: { subscription: @subscription.attributes.except('id', 'created_at', 'updated_at'), auth_token: @auth_token },
          as: :turbo_stream
        )
      end

      assert_response :success
    end

    test 'show ok' do
      get url_for(controller: 'email/subscriptions', action: 'show', id: @subscription.id), params: { auth_token: @auth_token }
      assert_response :success
    end

    test 'edit ok' do
      get url_for(controller: 'email/subscriptions', action: 'edit', id: @subscription.id), params: { auth_token: @auth_token }
      assert_response :success
    end

    test 'update ok' do
      patch(
        url_for(controller: 'email/subscriptions', action: 'update', id: @subscription.id),
        params: { subscription: { address: 'xx' }, auth_token: @auth_token },
        as: :turbo_stream
      )

      @subscription.reload
      assert_equal 'xx', @subscription.address
      assert_response :success
    end

    test 'destroy ok' do
      assert_difference('Email::Subscription.count', -1) do
        delete url_for(controller: 'email/subscriptions', action: 'destroy', id: @subscription.id), params: { auth_token: @auth_token }, as: :turbo_stream
      end

      assert_response :success
    end

  end
end
