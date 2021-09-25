require "application_system_test_case"

class EquiposTest < ApplicationSystemTestCase
  setup do
    @equipo = equipos(:one)
  end

  test "visiting the index" do
    visit equipos_url
    assert_selector "h1", text: "Equipos"
  end

  test "creating a Equipo" do
    visit equipos_url
    click_on "New Equipo"

    fill_in "Estadio", with: @equipo.estadio
    fill_in "Mascota", with: @equipo.mascota
    fill_in "Nombre", with: @equipo.nombre
    click_on "Create Equipo"

    assert_text "Equipo was successfully created"
    click_on "Back"
  end

  test "updating a Equipo" do
    visit equipos_url
    click_on "Edit", match: :first

    fill_in "Estadio", with: @equipo.estadio
    fill_in "Mascota", with: @equipo.mascota
    fill_in "Nombre", with: @equipo.nombre
    click_on "Update Equipo"

    assert_text "Equipo was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipo" do
    visit equipos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipo was successfully destroyed"
  end
end
