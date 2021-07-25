require 'test_helper'
module Email
  class Admin::SubscriptionsControllerTest < ActionDispatch::IntegrationTest

    setup do
      @subscription = email_subscriptions(:one)
    end

    test 'index ok' do
      get url_for(controller: 'email/admin/subscriptions')
      assert_response :success
    end

    test 'new ok' do
      get url_for(controller: 'email/admin/subscriptions', action: 'new')
      assert_response :success
    end

    test 'create ok' do
      assert_difference('Email::Subscription.count') do
        post(
          url_for(controller: 'email/admin/subscriptions', action: 'create'),
          params: { subscription: @subscription.attributes.except('id', 'created_at', 'updated_at') },
          as: :turbo_stream
        )
      end

      assert_response :success
    end

    test 'show ok' do
      get url_for(controller: 'email/admin/subscriptions', action: 'show', id: @subscription.id)
      assert_response :success
    end

    test 'edit ok' do
      get url_for(controller: 'email/admin/subscriptions', action: 'edit', id: @subscription.id)
      assert_response :success
    end

    test 'update ok' do
      patch(
        url_for(controller: 'email/admin/subscriptions', action: 'update', id: @subscription.id),
        params: { subscription: { address: 'xx' } },
        as: :turbo_stream
      )

      @subscription.reload
      assert_equal 'xx', @subscription.address
      assert_response :success
    end

    test 'destroy ok' do
      assert_difference('Email::Subscription.count', -1) do
        delete url_for(controller: 'email/admin/subscriptions', action: 'destroy', id: @subscription.id), as: :turbo_stream
      end

      assert_response :success
    end

  end
end
