require "application_system_test_case"

class LogCspsTest < ApplicationSystemTestCase
  setup do
    @admin_log_csp = admin_log_csps(:one)
  end

  test "visiting the index" do
    visit admin_log_csps_url
    assert_selector "h1", text: "Log Csps"
  end

  test "creating a Log csp" do
    visit admin_log_csps_url
    click_on "New Log Csp"

    fill_in "Blocked Uri", with: @admin_log_csp.blocked_uri
    fill_in "Document Uri", with: @admin_log_csp.document_uri
    fill_in "Original Policy", with: @admin_log_csp.original_policy
    fill_in "Referrer", with: @admin_log_csp.referrer
    fill_in "Violated Directive", with: @admin_log_csp.violated_directive
    click_on "Create Log csp"

    assert_text "Log csp was successfully created"
    click_on "Back"
  end

  test "updating a Log csp" do
    visit admin_log_csps_url
    click_on "Edit", match: :first

    fill_in "Blocked Uri", with: @admin_log_csp.blocked_uri
    fill_in "Document Uri", with: @admin_log_csp.document_uri
    fill_in "Original Policy", with: @admin_log_csp.original_policy
    fill_in "Referrer", with: @admin_log_csp.referrer
    fill_in "Violated Directive", with: @admin_log_csp.violated_directive
    click_on "Update Log csp"

    assert_text "Log csp was successfully updated"
    click_on "Back"
  end

  test "destroying a Log csp" do
    visit admin_log_csps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log csp was successfully destroyed"
  end
end
