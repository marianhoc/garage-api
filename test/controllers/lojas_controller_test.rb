require 'test_helper'

class LojasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loja = lojas(:one)
  end

  test "should get index" do
    get lojas_url, as: :json
    assert_response :success
  end

  test "should create loja" do
    assert_difference('Loja.count') do
      post lojas_url, params: { loja: { cnpj: @loja.cnpj, endereco: @loja.endereco, latitude: @loja.latitude, longitude: @loja.longitude, nome: @loja.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show loja" do
    get loja_url(@loja), as: :json
    assert_response :success
  end

  test "should update loja" do
    patch loja_url(@loja), params: { loja: { cnpj: @loja.cnpj, endereco: @loja.endereco, latitude: @loja.latitude, longitude: @loja.longitude, nome: @loja.nome } }, as: :json
    assert_response 200
  end

  test "should destroy loja" do
    assert_difference('Loja.count', -1) do
      delete loja_url(@loja), as: :json
    end

    assert_response 204
  end
end
