require 'test_helper'

class ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_room = chat_rooms(:one)
  end

  test "should get index" do
    get chat_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_room_url
    assert_response :success
  end

  test "should create chat_room" do
    assert_difference('ChatRoom.count') do
      post chat_rooms_url, params: { chat_room: {  } }
    end

    assert_redirected_to chat_room_url(ChatRoom.last)
  end

  test "should show chat_room" do
    get chat_room_url(@chat_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_room_url(@chat_room)
    assert_response :success
  end

  test "should update chat_room" do
    patch chat_room_url(@chat_room), params: { chat_room: {  } }
    assert_redirected_to chat_room_url(@chat_room)
  end

  test "should destroy chat_room" do
    assert_difference('ChatRoom.count', -1) do
      delete chat_room_url(@chat_room)
    end

    assert_redirected_to chat_rooms_url
  end
end
