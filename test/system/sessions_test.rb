require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @session = sessions(:one)
  end

  test "visiting the index" do
    visit sessions_url
    assert_selector "h1", text: "Sessions"
  end

  test "should create session" do
    visit sessions_url
    click_on "New session"

    fill_in "Event", with: @session.event_id
    fill_in "Game", with: @session.game_id
    fill_in "Max slots", with: @session.max_slots
    fill_in "Slot number", with: @session.slot_number
    fill_in "User", with: @session.user_id
    click_on "Create Session"

    assert_text "Session was successfully created"
    click_on "Back"
  end

  test "should update Session" do
    visit session_url(@session)
    click_on "Edit this session", match: :first

    fill_in "Event", with: @session.event_id
    fill_in "Game", with: @session.game_id
    fill_in "Max slots", with: @session.max_slots
    fill_in "Slot number", with: @session.slot_number
    fill_in "User", with: @session.user_id
    click_on "Update Session"

    assert_text "Session was successfully updated"
    click_on "Back"
  end

  test "should destroy Session" do
    visit session_url(@session)
    click_on "Destroy this session", match: :first

    assert_text "Session was successfully destroyed"
  end
end
