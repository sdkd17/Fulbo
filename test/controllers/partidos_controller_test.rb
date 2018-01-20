require 'test_helper'

class PartidosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partidos_index_url
    assert_response :success
  end

  test "should get show" do
    get partidos_show_url
    assert_response :success
  end

  test "should get new" do
    get partidos_new_url
    assert_response :success
  end

  test "should get create" do
    get partidos_create_url
    assert_response :success
  end

end
