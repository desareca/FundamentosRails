require "application_system_test_case"

class NinjasTest < ApplicationSystemTestCase
  setup do
    @ninja = ninjas(:one)
  end

  test "visiting the index" do
    visit ninjas_url
    assert_selector "h1", text: "Ninjas"
  end

  test "creating a Ninja" do
    visit ninjas_url
    click_on "New Ninja"

    fill_in "Dojo id", with: @ninja.dojo_id_id
    fill_in "First name", with: @ninja.first_name
    fill_in "Last name", with: @ninja.last_name
    click_on "Create Ninja"

    assert_text "Ninja was successfully created"
    click_on "Back"
  end

  test "updating a Ninja" do
    visit ninjas_url
    click_on "Edit", match: :first

    fill_in "Dojo id", with: @ninja.dojo_id_id
    fill_in "First name", with: @ninja.first_name
    fill_in "Last name", with: @ninja.last_name
    click_on "Update Ninja"

    assert_text "Ninja was successfully updated"
    click_on "Back"
  end

  test "destroying a Ninja" do
    visit ninjas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ninja was successfully destroyed"
  end
end
