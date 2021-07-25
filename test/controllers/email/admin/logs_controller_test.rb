require 'test_helper'
module Email
  class Admin::LogsControllerTest < ActionDispatch::IntegrationTest

    setup do
      @log = email_logs(:one)
    end

    test 'index ok' do
      get url_for(controller: 'email/admin/logs')
      assert_response :success
    end

    test 'show ok' do
      get url_for(controller: 'email/admin/logs', action: 'show', id: @log.id)
      assert_response :success
    end

    test 'edit ok' do
      get url_for(controller: 'email/admin/logs', action: 'edit', id: @log.id)
      assert_response :success
    end

    test 'update ok' do
      patch(
        url_for(controller: 'email/admin/logs', action: 'update', id: @log.id),
        params: { log: {  } },
        as: :turbo_stream
      )
      assert_response :success
    end

    test 'destroy ok' do
      assert_difference('Email::Log.count', -1) do
        delete url_for(controller: 'email/admin/logs', action: 'update', id: @log.id), as: :turbo_stream
      end

      assert_response :success
    end

  end
end
