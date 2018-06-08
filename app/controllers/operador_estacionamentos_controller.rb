class OperadorEstacionamentosController < ApplicationController
  before_action :set_operador_estacionamento, only: [:show, :update, :destroy]

  # GET /operador_estacionamentos
  def index
    @operador_estacionamentos = OperadorEstacionamento.all

    render json: @operador_estacionamentos
  end

  # GET /operador_estacionamentos/1
  def show
    render json: @operador_estacionamento
  end

  # POST /operador_estacionamentos
  def create
    @operador_estacionamento = OperadorEstacionamento.new(operador_estacionamento_params)

    if @operador_estacionamento.save
      render json: @operador_estacionamento, status: :created, location: @operador_estacionamento
    else
      render json: @operador_estacionamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operador_estacionamentos/1
  def update
    if @operador_estacionamento.update(operador_estacionamento_params)
      render json: @operador_estacionamento
    else
      render json: @operador_estacionamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /operador_estacionamentos/1
  def destroy
    @operador_estacionamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operador_estacionamento
      @operador_estacionamento = OperadorEstacionamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def operador_estacionamento_params
      params.require(:operador_estacionamento).permit(:user_id, :estacionamento_id, :cpf)
    end
end
