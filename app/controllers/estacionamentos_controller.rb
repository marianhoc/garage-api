class EstacionamentosController < ApplicationController
  before_action :set_estacionamento, only: [:show, :update, :destroy]

  # GET /estacionamentos
  def index
    @estacionamentos = Estacionamento.all

    render json: @estacionamentos
  end

  # GET /estacionamentos/1
  def show
    render json: @estacionamento
  end

  # POST /estacionamentos
  def create
    @estacionamento = Estacionamento.new(estacionamento_params)

    if @estacionamento.save
      render json: @estacionamento, status: :created, location: @estacionamento
    else
      render json: @estacionamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estacionamentos/1
  def update
    if @estacionamento.update(estacionamento_params)
      render json: @estacionamento
    else
      render json: @estacionamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estacionamentos/1
  def destroy
    @estacionamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estacionamento
      @estacionamento = Estacionamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estacionamento_params
      params.require(:estacionamento).permit(:nome, :endereco, :telefone, :razao_social, :cnpj, :aberto)
    end
end
