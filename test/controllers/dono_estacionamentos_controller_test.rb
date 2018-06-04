require 'test_helper'

class DonoEstacionamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dono_estacionamento = dono_estacionamentos(:one)
  end

  test "should get index" do
    get dono_estacionamentos_url, as: :json
    assert_response :success
  end

  test "should create dono_estacionamento" do
    assert_difference('DonoEstacionamento.count') do
      post dono_estacionamentos_url, params: { dono_estacionamento: { cpf: @dono_estacionamento.cpf, user_id: @dono_estacionamento.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show dono_estacionamento" do
    get dono_estacionamento_url(@dono_estacionamento), as: :json
    assert_response :success
  end

  test "should update dono_estacionamento" do
    patch dono_estacionamento_url(@dono_estacionamento), params: { dono_estacionamento: { cpf: @dono_estacionamento.cpf, user_id: @dono_estacionamento.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy dono_estacionamento" do
    assert_difference('DonoEstacionamento.count', -1) do
      delete dono_estacionamento_url(@dono_estacionamento), as: :json
    end

    assert_response 204
  end
end
