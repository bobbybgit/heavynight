require "test_helper"

class EventSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_setting = event_settings(:one)
  end

  test "should get index" do
    get event_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_event_setting_url
    assert_response :success
  end

  test "should create event_setting" do
    assert_difference("EventSetting.count") do
      post event_settings_url, params: { event_setting: { event_id: @event_setting.event_id, group_id: @event_setting.group_id, max_length: @event_setting.max_length, max_per_session: @event_setting.max_per_session, max_weight: @event_setting.max_weight, min_length: @event_setting.min_length, min_per_session: @event_setting.min_per_session, min_weight: @event_setting.min_weight, use_rec_count: @event_setting.use_rec_count } }
    end

    assert_redirected_to event_setting_url(EventSetting.last)
  end

  test "should show event_setting" do
    get event_setting_url(@event_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_setting_url(@event_setting)
    assert_response :success
  end

  test "should update event_setting" do
    patch event_setting_url(@event_setting), params: { event_setting: { event_id: @event_setting.event_id, group_id: @event_setting.group_id, max_length: @event_setting.max_length, max_per_session: @event_setting.max_per_session, max_weight: @event_setting.max_weight, min_length: @event_setting.min_length, min_per_session: @event_setting.min_per_session, min_weight: @event_setting.min_weight, use_rec_count: @event_setting.use_rec_count } }
    assert_redirected_to event_setting_url(@event_setting)
  end

  test "should destroy event_setting" do
    assert_difference("EventSetting.count", -1) do
      delete event_setting_url(@event_setting)
    end

    assert_redirected_to event_settings_url
  end
end
