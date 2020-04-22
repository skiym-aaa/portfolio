require 'test_helper'

class PlacePhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get place_photos_show_url
    assert_response :success
  end

end
