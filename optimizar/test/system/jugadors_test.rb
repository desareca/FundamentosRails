require "application_system_test_case"

class JugadorsTest < ApplicationSystemTestCase
  setup do
    @jugador = jugadors(:one)
  end

  test "visiting the index" do
    visit jugadors_url
    assert_selector "h1", text: "Jugadors"
  end

  test "creating a Jugador" do
    visit jugadors_url
    click_on "New Jugador"

    fill_in "Equipo", with: @jugador.equipo_id
    fill_in "Nombre", with: @jugador.nombre
    click_on "Create Jugador"

    assert_text "Jugador was successfully created"
    click_on "Back"
  end

  test "updating a Jugador" do
    visit jugadors_url
    click_on "Edit", match: :first

    fill_in "Equipo", with: @jugador.equipo_id
    fill_in "Nombre", with: @jugador.nombre
    click_on "Update Jugador"

    assert_text "Jugador was successfully updated"
    click_on "Back"
  end

  test "destroying a Jugador" do
    visit jugadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jugador was successfully destroyed"
  end
end
