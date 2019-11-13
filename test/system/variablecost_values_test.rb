require "application_system_test_case"

class VariablecostValuesTest < ApplicationSystemTestCase
  setup do
    @variablecost_value = variablecost_values(:one)
  end

  test "visiting the index" do
    visit variablecost_values_url
    assert_selector "h1", text: "Variablecost Values"
  end

  test "creating a Variablecost value" do
    visit variablecost_values_url
    click_on "New Variablecost Value"

    click_on "Create Variablecost value"

    assert_text "Variablecost value was successfully created"
    click_on "Back"
  end

  test "updating a Variablecost value" do
    visit variablecost_values_url
    click_on "Edit", match: :first

    click_on "Update Variablecost value"

    assert_text "Variablecost value was successfully updated"
    click_on "Back"
  end

  test "destroying a Variablecost value" do
    visit variablecost_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Variablecost value was successfully destroyed"
  end
end
