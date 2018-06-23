class EstacionamentosFavoritosController < ApplicationController
  before_action :set_estacionamentos_favorito, only: [:show, :update, :destroy]

  # GET /estacionamentos_favoritos
  def index
    @estacionamentos_favoritos = EstacionamentosFavorito.all

    render json: @estacionamentos_favoritos
  end

  # GET /estacionamentos_favoritos/1
  def show
    render json: @estacionamentos_favorito
  end

  # POST /estacionamentos_favoritos
  def create
    @estacionamentos_favorito = EstacionamentosFavorito.new(estacionamentos_favorito_params)

    if @estacionamentos_favorito.save
      render json: @estacionamentos_favorito, status: :created, location: @estacionamentos_favorito
    else
      render json: @estacionamentos_favorito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estacionamentos_favoritos/1
  def update
    if @estacionamentos_favorito.update(estacionamentos_favorito_params)
      render json: @estacionamentos_favorito
    else
      render json: @estacionamentos_favorito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estacionamentos_favoritos/1
  def destroy
    @estacionamentos_favorito.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estacionamentos_favorito
      @estacionamentos_favorito = EstacionamentosFavorito.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estacionamentos_favorito_params
      params.require(:estacionamentos_favorito).permit(:normal_user_id, :estacionamento_id)
    end
end
