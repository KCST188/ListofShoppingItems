require "test_helper"

class ListShoppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_shopping = list_shoppings(:one)
  end

  test "should get index" do
    get list_shoppings_url
    assert_response :success
  end

  test "should get new" do
    get new_list_shopping_url
    assert_response :success
  end

  test "should create list_shopping" do
    assert_difference('ListShopping.count') do
      post list_shoppings_url, params: { list_shopping: { name: @list_shopping.name } }
    end

    assert_redirected_to list_shopping_url(ListShopping.last)
  end

  test "should show list_shopping" do
    get list_shopping_url(@list_shopping)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_shopping_url(@list_shopping)
    assert_response :success
  end

  test "should update list_shopping" do
    patch list_shopping_url(@list_shopping), params: { list_shopping: { name: @list_shopping.name } }
    assert_redirected_to list_shopping_url(@list_shopping)
  end

  test "should destroy list_shopping" do
    assert_difference('ListShopping.count', -1) do
      delete list_shopping_url(@list_shopping)
    end

    assert_redirected_to list_shoppings_url
  end
end
