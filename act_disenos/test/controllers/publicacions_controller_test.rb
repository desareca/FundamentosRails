require "test_helper"

class PublicacionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publicacions_index_url
    assert_response :success
  end
end
