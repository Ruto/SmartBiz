require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { active: @product.active, code: @product.code, custom_code: @product.custom_code, divisible: @product.divisible, expense: @product.expense, goods: @product.goods, income: @product.income, name: @product.name, service: @product.service, user_id: @product.user_id, value_addable: @product.value_addable } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { active: @product.active, code: @product.code, custom_code: @product.custom_code, divisible: @product.divisible, expense: @product.expense, goods: @product.goods, income: @product.income, name: @product.name, service: @product.service, user_id: @product.user_id, value_addable: @product.value_addable } }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json
    end

    assert_response 204
  end
end
