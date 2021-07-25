require 'test_helper'
module Email
  class Admin::TemplatesControllerTest < ActionDispatch::IntegrationTest

    setup do
      @template = email_templates(:one)
    end

    test 'index ok' do
      get url_for(controller: 'email/admin/templates')
      assert_response :success
    end

    test 'new ok' do
      get url_for(controller: 'email/admin/templates', action: 'new')
      assert_response :success
    end

    test 'create ok' do
      assert_difference('Email::Template.count') do
        post(
          url_for(controller: 'email/admin/templates', action: 'create'),
          params: { template: @template.attributes.except('id', 'created_at', 'updated_at') },
          as: :turbo_stream
        )
      end

      assert_response :success
    end

    test 'show ok' do
      get url_for(controller: 'email/admin/templates', action: 'show', id: @template.id)
      assert_response :success
    end

    test 'edit ok' do
      get url_for(controller: 'email/admin/templates', action: 'edit', id: @template.id)
      assert_response :success
    end

    test 'update ok' do
      patch(
        url_for(controller: 'email/admin/templates', action: 'update', id: @template.id),
        params: { template: { subject: 'xx' } },
        as: :turbo_stream
      )

      @template.reload
      assert_equal 'xx', @template.subject
      assert_response :success
    end

    test 'destroy ok' do
      assert_difference('Email::Template.count', -1) do
        delete url_for(controller: 'email/admin/templates', action: 'destroy', id: @template.id), as: :turbo_stream
      end

      assert_response :success
    end

  end
end
