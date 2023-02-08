require "test_helper"

class WallMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wall_message = wall_messages(:one)
  end

  test "should get index" do
    get wall_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_wall_message_url
    assert_response :success
  end

  test "should create wall_message" do
    assert_difference("WallMessage.count") do
      post wall_messages_url, params: { wall_message: { content: @wall_message.content, group_id: @wall_message.group_id, user_id: @wall_message.user_id } }
    end

    assert_redirected_to wall_message_url(WallMessage.last)
  end

  test "should show wall_message" do
    get wall_message_url(@wall_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_wall_message_url(@wall_message)
    assert_response :success
  end

  test "should update wall_message" do
    patch wall_message_url(@wall_message), params: { wall_message: { content: @wall_message.content, group_id: @wall_message.group_id, user_id: @wall_message.user_id } }
    assert_redirected_to wall_message_url(@wall_message)
  end

  test "should destroy wall_message" do
    assert_difference("WallMessage.count", -1) do
      delete wall_message_url(@wall_message)
    end

    assert_redirected_to wall_messages_url
  end
end
