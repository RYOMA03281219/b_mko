require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_items_update_url
    assert_response :success
  end
end
