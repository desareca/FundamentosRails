require "test_helper"

class TiemposControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get tiempos_main_url
    assert_response :success
  end
end
