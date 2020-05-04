require 'test_helper'

class StructurablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @structurable = structurables(:one)
  end

  test "should get index" do
    get structurables_url, as: :json
    assert_response :success
  end

  test "should create structurable" do
    assert_difference('Structurable.count') do
      post structurables_url, params: { structurable: { active: @structurable.active, cost_code: @structurable.cost_code, structure_id: @structurable.structure_id, structured_id: @structurable.structured_id, user_id: @structurable.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show structurable" do
    get structurable_url(@structurable), as: :json
    assert_response :success
  end

  test "should update structurable" do
    patch structurable_url(@structurable), params: { structurable: { active: @structurable.active, cost_code: @structurable.cost_code, structure_id: @structurable.structure_id, structured_id: @structurable.structured_id, user_id: @structurable.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy structurable" do
    assert_difference('Structurable.count', -1) do
      delete structurable_url(@structurable), as: :json
    end

    assert_response 204
  end
end
