require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get message" do
    get pages_message_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get events" do
    get pages_events_url
    assert_response :success
  end

  test "should get listen" do
    get pages_listen_url
    assert_response :success
  end

end
