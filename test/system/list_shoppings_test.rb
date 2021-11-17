require "application_system_test_case"

class ListShoppingsTest < ApplicationSystemTestCase
  setup do
    @list_shopping = list_shoppings(:one)
  end

  test "visiting the index" do
    visit list_shoppings_url
    assert_selector "h1", text: "List Shoppings"
  end

  test "creating a List shopping" do
    visit list_shoppings_url
    click_on "New List Shopping"

    fill_in "Name", with: @list_shopping.name
    click_on "Create List shopping"

    assert_text "List shopping was successfully created"
    click_on "Back"
  end

  test "updating a List shopping" do
    visit list_shoppings_url
    click_on "Edit", match: :first

    fill_in "Name", with: @list_shopping.name
    click_on "Update List shopping"

    assert_text "List shopping was successfully updated"
    click_on "Back"
  end

  test "destroying a List shopping" do
    visit list_shoppings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List shopping was successfully destroyed"
  end
end
