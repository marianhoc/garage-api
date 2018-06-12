class OperadorLojasController < ApplicationController
  before_action :set_operador_loja, only: [:show, :update, :destroy]

  # GET /operador_lojas
  def index
    @operador_lojas = OperadorLoja.all

    render json: @operador_lojas
  end

  # GET /operador_lojas/1
  def show
    render json: @operador_loja
  end

  # POST /operador_lojas
  def create
    @operador_loja = OperadorLoja.new(operador_loja_params)

    if @operador_loja.save
      render json: @operador_loja, status: :created, location: @operador_loja
    else
      render json: @operador_loja.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operador_lojas/1
  def update
    if @operador_loja.update(operador_loja_params)
      render json: @operador_loja
    else
      render json: @operador_loja.errors, status: :unprocessable_entity
    end
  end

  # DELETE /operador_lojas/1
  def destroy
    @operador_loja.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operador_loja
      @operador_loja = OperadorLoja.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def operador_loja_params
      params.require(:operador_loja).permit(:loja_id, :cpf)
    end
end
