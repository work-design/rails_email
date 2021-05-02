require "application_system_test_case"

class LogsTest < ApplicationSystemTestCase
  setup do
    @email_admin_log = email_admin_logs(:one)
  end

  test "visiting the index" do
    visit email_admin_logs_url
    assert_selector "h1", text: "Logs"
  end

  test "creating a Log" do
    visit email_admin_logs_url
    click_on "New Log"

    fill_in "Created at", with: @email_admin_log.created_at
    fill_in "Mail from", with: @email_admin_log.mail_from
    fill_in "Mail to", with: @email_admin_log.mail_to
    fill_in "Sent result", with: @email_admin_log.sent_result
    fill_in "Sent status", with: @email_admin_log.sent_status
    click_on "Create Log"

    assert_text "Log was successfully created"
    click_on "Back"
  end

  test "updating a Log" do
    visit email_admin_logs_url
    click_on "Edit", match: :first

    fill_in "Created at", with: @email_admin_log.created_at
    fill_in "Mail from", with: @email_admin_log.mail_from
    fill_in "Mail to", with: @email_admin_log.mail_to
    fill_in "Sent result", with: @email_admin_log.sent_result
    fill_in "Sent status", with: @email_admin_log.sent_status
    click_on "Update Log"

    assert_text "Log was successfully updated"
    click_on "Back"
  end

  test "destroying a Log" do
    visit email_admin_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log was successfully destroyed"
  end
end
