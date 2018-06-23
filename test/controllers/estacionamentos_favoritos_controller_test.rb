require 'test_helper'

class EstacionamentosFavoritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estacionamentos_favorito = estacionamentos_favoritos(:one)
  end

  test "should get index" do
    get estacionamentos_favoritos_url, as: :json
    assert_response :success
  end

  test "should create estacionamentos_favorito" do
    assert_difference('EstacionamentosFavorito.count') do
      post estacionamentos_favoritos_url, params: { estacionamentos_favorito: { estacionamento_id: @estacionamentos_favorito.estacionamento_id, user_id: @estacionamentos_favorito.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show estacionamentos_favorito" do
    get estacionamentos_favorito_url(@estacionamentos_favorito), as: :json
    assert_response :success
  end

  test "should update estacionamentos_favorito" do
    patch estacionamentos_favorito_url(@estacionamentos_favorito), params: { estacionamentos_favorito: { estacionamento_id: @estacionamentos_favorito.estacionamento_id, user_id: @estacionamentos_favorito.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy estacionamentos_favorito" do
    assert_difference('EstacionamentosFavorito.count', -1) do
      delete estacionamentos_favorito_url(@estacionamentos_favorito), as: :json
    end

    assert_response 204
  end
end
