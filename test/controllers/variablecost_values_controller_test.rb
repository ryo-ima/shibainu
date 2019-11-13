require 'test_helper'

class VariablecostValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variablecost_value = variablecost_values(:one)
  end

  test "should get index" do
    get variablecost_values_url
    assert_response :success
  end

  test "should get new" do
    get new_variablecost_value_url
    assert_response :success
  end

  test "should create variablecost_value" do
    assert_difference('VariablecostValue.count') do
      post variablecost_values_url, params: { variablecost_value: {  } }
    end

    assert_redirected_to variablecost_value_url(VariablecostValue.last)
  end

  test "should show variablecost_value" do
    get variablecost_value_url(@variablecost_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_variablecost_value_url(@variablecost_value)
    assert_response :success
  end

  test "should update variablecost_value" do
    patch variablecost_value_url(@variablecost_value), params: { variablecost_value: {  } }
    assert_redirected_to variablecost_value_url(@variablecost_value)
  end

  test "should destroy variablecost_value" do
    assert_difference('VariablecostValue.count', -1) do
      delete variablecost_value_url(@variablecost_value)
    end

    assert_redirected_to variablecost_values_url
  end
end
