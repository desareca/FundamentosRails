require "test_helper"

class DojosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dojos_index_url
    assert_response :success
  end

  test "should get show" do
    get dojos_show_url
    assert_response :success
  end

  test "should get new" do
    get dojos_new_url
    assert_response :success
  end

  test "should get create" do
    get dojos_create_url
    assert_response :success
  end

  test "should get edit" do
    get dojos_edit_url
    assert_response :success
  end

  test "should get update" do
    get dojos_update_url
    assert_response :success
  end

  test "should get delete" do
    get dojos_delete_url
    assert_response :success
  end
end
