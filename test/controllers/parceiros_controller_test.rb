require 'test_helper'

class ParceirosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parceiro = parceiros(:one)
  end

  test "should get index" do
    get parceiros_url, as: :json
    assert_response :success
  end

  test "should create parceiro" do
    assert_difference('Parceiro.count') do
      post parceiros_url, params: { parceiro: { cnpj: @parceiro.cnpj, nome: @parceiro.nome, telefone: @parceiro.telefone } }, as: :json
    end

    assert_response 201
  end

  test "should show parceiro" do
    get parceiro_url(@parceiro), as: :json
    assert_response :success
  end

  test "should update parceiro" do
    patch parceiro_url(@parceiro), params: { parceiro: { cnpj: @parceiro.cnpj, nome: @parceiro.nome, telefone: @parceiro.telefone } }, as: :json
    assert_response 200
  end

  test "should destroy parceiro" do
    assert_difference('Parceiro.count', -1) do
      delete parceiro_url(@parceiro), as: :json
    end

    assert_response 204
  end
end
