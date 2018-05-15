class ParceirosController < ApplicationController
  before_action :set_parceiro, only: [:show, :update, :destroy]

  # GET /parceiros
  def index
    @parceiros = Partner.all

    render json: @parceiros
  end

  # GET /parceiros/1
  def show
    render json: @parceiro
  end

  # POST /parceiros
  def create
    user = User.new(parceiro_params)

    if user.save
      @parceiro = user.build_partner
      if @parceiro.save
        render json: @parceiro, status: :created, location: @parceiro
      else
        render json: @parceiro.errors, status: :unprocessable_entity
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parceiros/1
  def update
    if @parceiro.user.update(parceiro_params)
      render json: @parceiro
    else
      render json: @parceiro.user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parceiros/1
  def destroy
    @parceiro.user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parceiro
      @parceiro = Partner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parceiro_params
      params.require(:parceiro)
            .permit(:name,
                    :cpf,
                    :email, 
                    :birth, 
                    :tel, 
                    :password, 
                    :password_confirmation, 
                    :token)
    end
end
