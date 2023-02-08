require "application_system_test_case"

class WallMessagesTest < ApplicationSystemTestCase
  setup do
    @wall_message = wall_messages(:one)
  end

  test "visiting the index" do
    visit wall_messages_url
    assert_selector "h1", text: "Wall messages"
  end

  test "should create wall message" do
    visit wall_messages_url
    click_on "New wall message"

    fill_in "Content", with: @wall_message.content
    fill_in "Group", with: @wall_message.group_id
    fill_in "User", with: @wall_message.user_id
    click_on "Create Wall message"

    assert_text "Wall message was successfully created"
    click_on "Back"
  end

  test "should update Wall message" do
    visit wall_message_url(@wall_message)
    click_on "Edit this wall message", match: :first

    fill_in "Content", with: @wall_message.content
    fill_in "Group", with: @wall_message.group_id
    fill_in "User", with: @wall_message.user_id
    click_on "Update Wall message"

    assert_text "Wall message was successfully updated"
    click_on "Back"
  end

  test "should destroy Wall message" do
    visit wall_message_url(@wall_message)
    click_on "Destroy this wall message", match: :first

    assert_text "Wall message was successfully destroyed"
  end
end
