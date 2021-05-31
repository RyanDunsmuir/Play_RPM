require 'test_helper'

class OrderSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_songs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get order_songs_destroy_url
    assert_response :success
  end

end
