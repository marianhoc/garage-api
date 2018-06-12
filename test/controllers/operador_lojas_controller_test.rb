require 'test_helper'

class OperadorLojasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operador_loja = operador_lojas(:one)
  end

  test "should get index" do
    get operador_lojas_url, as: :json
    assert_response :success
  end

  test "should create operador_loja" do
    assert_difference('OperadorLoja.count') do
      post operador_lojas_url, params: { operador_loja: { cpf: @operador_loja.cpf, loja_id: @operador_loja.loja_id } }, as: :json
    end

    assert_response 201
  end

  test "should show operador_loja" do
    get operador_loja_url(@operador_loja), as: :json
    assert_response :success
  end

  test "should update operador_loja" do
    patch operador_loja_url(@operador_loja), params: { operador_loja: { cpf: @operador_loja.cpf, loja_id: @operador_loja.loja_id } }, as: :json
    assert_response 200
  end

  test "should destroy operador_loja" do
    assert_difference('OperadorLoja.count', -1) do
      delete operador_loja_url(@operador_loja), as: :json
    end

    assert_response 204
  end
end
