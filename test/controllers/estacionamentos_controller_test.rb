require 'test_helper'

class EstacionamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estacionamento = estacionamentos(:one)
  end

  test "should get index" do
    get estacionamentos_url, as: :json
    assert_response :success
  end

  test "should create estacionamento" do
    assert_difference('Estacionamento.count') do
      post estacionamentos_url, params: { estacionamento: { cnpj: @estacionamento.cnpj, endereco: @estacionamento.endereco, nome: @estacionamento.nome, razao_social: @estacionamento.razao_social, telefone: @estacionamento.telefone } }, as: :json
    end

    assert_response 201
  end

  test "should show estacionamento" do
    get estacionamento_url(@estacionamento), as: :json
    assert_response :success
  end

  test "should update estacionamento" do
    patch estacionamento_url(@estacionamento), params: { estacionamento: { cnpj: @estacionamento.cnpj, endereco: @estacionamento.endereco, nome: @estacionamento.nome, razao_social: @estacionamento.razao_social, telefone: @estacionamento.telefone } }, as: :json
    assert_response 200
  end

  test "should destroy estacionamento" do
    assert_difference('Estacionamento.count', -1) do
      delete estacionamento_url(@estacionamento), as: :json
    end

    assert_response 204
  end
end
