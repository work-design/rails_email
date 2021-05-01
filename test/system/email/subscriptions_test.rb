require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  setup do
    @email_subscription = email_subscriptions(:one)
  end

  test "visiting the index" do
    visit email_subscriptions_url
    assert_selector "h1", text: "Subscriptions"
  end

  test "creating a Subscription" do
    visit email_subscriptions_url
    click_on "New Subscription"

    fill_in "Address", with: @email_subscription.address
    fill_in "State", with: @email_subscription.state
    fill_in "Unsubscribe at", with: @email_subscription.unsubscribe_at
    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "updating a Subscription" do
    visit email_subscriptions_url
    click_on "Edit", match: :first

    fill_in "Address", with: @email_subscription.address
    fill_in "State", with: @email_subscription.state
    fill_in "Unsubscribe at", with: @email_subscription.unsubscribe_at
    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription" do
    visit email_subscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription was successfully destroyed"
  end
end
