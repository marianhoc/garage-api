class ParceirosController < ApplicationController
  before_action :set_parceiro, only: [:show, :update, :destroy]

  # GET /parceiros
  def index
    @parceiros = Parceiro.all

    render json: @parceiros
  end

  # GET /parceiros/1
  def show
    render json: @parceiro
  end

  # POST /parceiros
  def create
    @parceiro = Parceiro.new(parceiro_params)

    if @parceiro.save
      render json: @parceiro, status: :created, location: @parceiro
    else
      render json: @parceiro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parceiros/1
  def update
    if @parceiro.update(parceiro_params)
      render json: @parceiro
    else
      render json: @parceiro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parceiros/1
  def destroy
    @parceiro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parceiro
      @parceiro = Parceiro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parceiro_params
      params.require(:parceiro).permit(:nome, :cnpj, :telefone)
    end
end
