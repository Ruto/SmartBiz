require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url, as: :json
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, balance: @transaction.balance, checked: @transaction.checked, closed: @transaction.closed, image_id: @transaction.image_id, memo: @transaction.memo, money_in: @transaction.money_in, money_out: @transaction.money_out, payable_id: @transaction.payable_id, payable_type: @transaction.payable_type, structure_id: @transaction.structure_id, total_balance: @transaction.total_balance, transaction_cost: @transaction.transaction_cost, type: @transaction.type, user_id: @transaction.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show transaction" do
    get transaction_url(@transaction), as: :json
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, balance: @transaction.balance, checked: @transaction.checked, closed: @transaction.closed, image_id: @transaction.image_id, memo: @transaction.memo, money_in: @transaction.money_in, money_out: @transaction.money_out, payable_id: @transaction.payable_id, payable_type: @transaction.payable_type, structure_id: @transaction.structure_id, total_balance: @transaction.total_balance, transaction_cost: @transaction.transaction_cost, type: @transaction.type, user_id: @transaction.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction), as: :json
    end

    assert_response 204
  end
end
