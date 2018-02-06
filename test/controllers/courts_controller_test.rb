require 'test_helper'

class CourtsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get courts_new_url
    assert_response :success
  end

  test "should get create" do
    get courts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get courts_destroy_url
    assert_response :success
  end

end
