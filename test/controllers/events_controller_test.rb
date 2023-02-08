require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { date: @event.date, end_time: @event.end_time, event_setting_id: @event.event_setting_id, group_id: @event.group_id, name: @event.name, session_id: @event.session_id, start_time: @event.start_time, venue_id: @event.venue_id } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { date: @event.date, end_time: @event.end_time, event_setting_id: @event.event_setting_id, group_id: @event.group_id, name: @event.name, session_id: @event.session_id, start_time: @event.start_time, venue_id: @event.venue_id } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
