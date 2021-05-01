require "application_system_test_case"

class TemplatesTest < ApplicationSystemTestCase
  setup do
    @email_admin_template = email_admin_templates(:one)
  end

  test "visiting the index" do
    visit email_admin_templates_url
    assert_selector "h1", text: "Templates"
  end

  test "creating a Template" do
    visit email_admin_templates_url
    click_on "New Template"

    fill_in "Body", with: @email_admin_template.body
    fill_in "Cover", with: @email_admin_template.cover
    fill_in "Honorific", with: @email_admin_template.honorific
    fill_in "Order prefix", with: @email_admin_template.order_prefix
    click_on "Create Template"

    assert_text "Template was successfully created"
    click_on "Back"
  end

  test "updating a Template" do
    visit email_admin_templates_url
    click_on "Edit", match: :first

    fill_in "Body", with: @email_admin_template.body
    fill_in "Cover", with: @email_admin_template.cover
    fill_in "Honorific", with: @email_admin_template.honorific
    fill_in "Order prefix", with: @email_admin_template.order_prefix
    click_on "Update Template"

    assert_text "Template was successfully updated"
    click_on "Back"
  end

  test "destroying a Template" do
    visit email_admin_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Template was successfully destroyed"
  end
end
