require 'test_helper'

class OperadorEstacionamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operador_estacionamento = operador_estacionamentos(:one)
  end

  test "should get index" do
    get operador_estacionamentos_url, as: :json
    assert_response :success
  end

  test "should create operador_estacionamento" do
    assert_difference('OperadorEstacionamento.count') do
      post operador_estacionamentos_url, params: { operador_estacionamento: { cpf: @operador_estacionamento.cpf, estacionamento_id: @operador_estacionamento.estacionamento_id, user_id: @operador_estacionamento.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show operador_estacionamento" do
    get operador_estacionamento_url(@operador_estacionamento), as: :json
    assert_response :success
  end

  test "should update operador_estacionamento" do
    patch operador_estacionamento_url(@operador_estacionamento), params: { operador_estacionamento: { cpf: @operador_estacionamento.cpf, estacionamento_id: @operador_estacionamento.estacionamento_id, user_id: @operador_estacionamento.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy operador_estacionamento" do
    assert_difference('OperadorEstacionamento.count', -1) do
      delete operador_estacionamento_url(@operador_estacionamento), as: :json
    end

    assert_response 204
  end
end
