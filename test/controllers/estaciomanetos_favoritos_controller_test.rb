require 'test_helper'

class EstaciomanetosFavoritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estaciomanetos_favorito = estaciomanetos_favoritos(:one)
  end

  test "should get index" do
    get estaciomanetos_favoritos_url, as: :json
    assert_response :success
  end

  test "should create estaciomanetos_favorito" do
    assert_difference('EstaciomanetosFavorito.count') do
      post estaciomanetos_favoritos_url, params: { estaciomanetos_favorito: { estacionamento_id: @estaciomanetos_favorito.estacionamento_id, user_id: @estaciomanetos_favorito.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show estaciomanetos_favorito" do
    get estaciomanetos_favorito_url(@estaciomanetos_favorito), as: :json
    assert_response :success
  end

  test "should update estaciomanetos_favorito" do
    patch estaciomanetos_favorito_url(@estaciomanetos_favorito), params: { estaciomanetos_favorito: { estacionamento_id: @estaciomanetos_favorito.estacionamento_id, user_id: @estaciomanetos_favorito.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy estaciomanetos_favorito" do
    assert_difference('EstaciomanetosFavorito.count', -1) do
      delete estaciomanetos_favorito_url(@estaciomanetos_favorito), as: :json
    end

    assert_response 204
  end
end
