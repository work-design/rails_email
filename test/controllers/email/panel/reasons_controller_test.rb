require 'test_helper'
module Email
  class Panel::ReasonsControllerTest < ActionDispatch::IntegrationTest

    setup do
      @reason = email_reasons(:one)
    end

    test 'index ok' do
      get url_for(controller: 'email/panel/reasons')
      assert_response :success
    end

    test 'new ok' do
      get url_for(controller: 'email/panel/reasons', action: 'new')
      assert_response :success
    end

    test 'create ok' do
      assert_difference('Reason.count') do
        post(
          url_for(controller: 'email/panel/reasons', action: 'create'),
          params: { reason: { body: 'x' } },
          as: :turbo_stream
        )
      end

      assert_response :success
    end

    test 'show ok' do
      get url_for(controller: 'email/panel/reasons', action: 'show', id: @reason.id)
      assert_response :success
    end

    test 'edit ok' do
      get url_for(controller: 'email/panel/reasons', action: 'edit', id: @reason.id)
      assert_response :success
    end

    test 'update ok' do
      patch(
        url_for(controller: 'email/panel/reasons', action: 'update', id: @reason.id),
        params: { reason: { body: 'xx' } },
        as: :turbo_stream
      )

      @reason.reload
      assert_equal 'xx', @reason.body
      assert_response :success
    end

    test 'destroy ok' do
      assert_difference('Email::Reason.count', -1) do
        delete url_for(controller: 'email/panel/reasons', action: 'destroy', id: @reason.id), as: :turbo_stream
      end

      assert_response :success
    end

  end
end
