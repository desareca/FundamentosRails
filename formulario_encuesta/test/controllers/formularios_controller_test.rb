require "test_helper"

class FormulariosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get formularios_new_url
    assert_response :success
  end

  test "should get create" do
    get formularios_create_url
    assert_response :success
  end

  test "should get result" do
    get formularios_result_url
    assert_response :success
  end
end
