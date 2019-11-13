require "application_system_test_case"

class IncomeValuesTest < ApplicationSystemTestCase
  setup do
    @income_value = income_values(:one)
  end

  test "visiting the index" do
    visit income_values_url
    assert_selector "h1", text: "Income Values"
  end

  test "creating a Income value" do
    visit income_values_url
    click_on "New Income Value"

    click_on "Create Income value"

    assert_text "Income value was successfully created"
    click_on "Back"
  end

  test "updating a Income value" do
    visit income_values_url
    click_on "Edit", match: :first

    click_on "Update Income value"

    assert_text "Income value was successfully updated"
    click_on "Back"
  end

  test "destroying a Income value" do
    visit income_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Income value was successfully destroyed"
  end
end
