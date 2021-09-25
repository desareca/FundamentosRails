require 'test_helper'

class RcontrollersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rcontrollers_index_url
    assert_response :success
  end

  test "should get hola" do
    get rcontrollers_hola_url
    assert_response :success
  end

  test "should get dice_hola" do
    get rcontrollers_dice_hola_url
    assert_response :success
  end

  test "should get nombre" do
    get rcontrollers_nombre_url
    assert_response :success
  end

  test "should get visita" do
    get rcontrollers_visita_url
    assert_response :success
  end

  test "should get restart" do
    get rcontrollers_restart_url
    assert_response :success
  end

end
