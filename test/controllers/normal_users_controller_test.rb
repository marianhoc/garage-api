require 'test_helper'

class NormalUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normal_user = normal_users(:one)
  end

  test "should get index" do
    get normal_users_url, as: :json
    assert_response :success
  end

  test "should create normal_user" do
    assert_difference('NormalUser.count') do
      post normal_users_url, params: { normal_user: { points: @normal_user.points, user_id: @normal_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show normal_user" do
    get normal_user_url(@normal_user), as: :json
    assert_response :success
  end

  test "should update normal_user" do
    patch normal_user_url(@normal_user), params: { normal_user: { points: @normal_user.points, user_id: @normal_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy normal_user" do
    assert_difference('NormalUser.count', -1) do
      delete normal_user_url(@normal_user), as: :json
    end

    assert_response 204
  end
end
