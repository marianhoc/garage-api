class StoreOwnersController < ApplicationController
  before_action :set_store_owner, only: [:show, :update, :destroy]

  # GET /store_owners
  def index
    @store_owners = StoreOwner.all

    render json: @store_owners
  end

  def add_credit
    if !params[:placa] && !params[:cpf]
      render json: { erro: ["Insira um CPF ou uma placa."] }, status: :unprocessable_entity
      return
    end
    if !params[:nota_fiscal]
      render json: { erro: ["Insira um código fiscal válido."] }, status: :unprocessable_entity
      return
    end
    @user = NormalUser.find_by(placa: params[:placa]) if params[:placa]
    @user = NormalUser.find_by(cpf: params[:cpf]) if params[:cpf]
    if @user.nil?
      render json: { erro: ["Usuário não encontrado."] }, status: :unprocessable_entity
      return
    end
    @credit = @user.add_credits(valor = params[:valor], nota_fiscal = params[:nota_fiscal])
    if @credit != false
      render json: @credit, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /store_owners/1
  def show
    render json: @store_owner
  end

  # POST /store_owners
  def create
    cpf = store_owner_params_create[:cpf]
    store_owner_params_create.delete(:cpf)
    user = User.new(store_owner_params_create)

    if user.save
      @store_owner = user.build_store_owner(cpf: cpf)
      if @store_owner.save
        render json: @store_owner, status: :created, location: @store_owner
      else
        user.destroy
        render json: @store_owner.errors, status: :unprocessable_entity
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_owners/1
  def update
    @user = @store_owner.user
    cpf = store_owner_params[:cpf]
    store_owner_params.delete(:cpf)
    
    if @user.update(store_owner_params)
      if @store_owner.update_attribute(:cpf, cpf)
        render json: @store_owner
      else
        render json: @store_owner.errors, status: :unprocessable_entity
      end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_owners/1
  def destroy
    @store_owner.user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_owner
      @store_owner = StoreOwner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_owner_params
      params.require(:user)
        .permit(:name,
          :cpf,
          :email, 
          :birth, 
          :tel, 
          :password, 
          :password_confirmation, 
          :token)
    end

    def store_owner_params_create
      params.require(:store_owner)
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
