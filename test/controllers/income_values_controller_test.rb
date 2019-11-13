require 'test_helper'

class IncomeValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income_value = income_values(:one)
  end

  test "should get index" do
    get income_values_url
    assert_response :success
  end

  test "should get new" do
    get new_income_value_url
    assert_response :success
  end

  test "should create income_value" do
    assert_difference('IncomeValue.count') do
      post income_values_url, params: { income_value: {  } }
    end

    assert_redirected_to income_value_url(IncomeValue.last)
  end

  test "should show income_value" do
    get income_value_url(@income_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_value_url(@income_value)
    assert_response :success
  end

  test "should update income_value" do
    patch income_value_url(@income_value), params: { income_value: {  } }
    assert_redirected_to income_value_url(@income_value)
  end

  test "should destroy income_value" do
    assert_difference('IncomeValue.count', -1) do
      delete income_value_url(@income_value)
    end

    assert_redirected_to income_values_url
  end
end
