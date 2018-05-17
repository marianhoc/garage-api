require 'test_helper'

class StoreOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_owner = store_owners(:one)
  end

  test "should get index" do
    get store_owners_url, as: :json
    assert_response :success
  end

  test "should create store_owner" do
    assert_difference('StoreOwner.count') do
      post store_owners_url, params: { store_owner: { cpf: @store_owner.cpf, user_id: @store_owner.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show store_owner" do
    get store_owner_url(@store_owner), as: :json
    assert_response :success
  end

  test "should update store_owner" do
    patch store_owner_url(@store_owner), params: { store_owner: { cpf: @store_owner.cpf, user_id: @store_owner.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy store_owner" do
    assert_difference('StoreOwner.count', -1) do
      delete store_owner_url(@store_owner), as: :json
    end

    assert_response 204
  end
end
