class NormalUsersController < ApplicationController
  before_action :set_normal_user, only: [:show, :update, :destroy]
  before_action :set_car, only: [:destroy_car]
  before_action :set_cartao, only: [:destroy_cartao]

  # GET /normal_users
  def index
    @normal_users = NormalUser.all

    render json: @normal_users
  end

  # GET /normal_users/1
  def show
    render json: @normal_user
  end

  # POST /normal_users
  def create
    @normal_user = NormalUser.new(normal_user_params)

    if @normal_user.save
      render json: @normal_user, status: :created, location: @normal_user
    else
      render json: @normal_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /normal_users/1
  def update
    if @normal_user.update(normal_user_params)
      render json: @normal_user
    else
      render json: @normal_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /normal_users/1
  def destroy
    @normal_user.destroy
  end

   # GET /normal_users/:id/cars
  def get_cars
    render json: @cars = Car.where(normal_user_id: params[:user_id])

  end

  # POST /normal_users/:user_id/newcar
  def save_car
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end

  end

  def destroy_car
    @car.destroy
  end


 #  =============================   CARTOES =============
  #    # GET /normal_users/:user_id/cartoes
  def get_cartoes

    render json: @cartoes = Card.where(normal_user_id: params[:normal_user_id])
  end

  # POST /normal_users/:user_id/newcartao
  def save_cartao


    puts " == = = = = = == = = = = = =  == == = = = = = === = = === "
    @cartao = Card.new(cartao_params)

    if @cartao.save
      render json: @cartao, status: :created
    else
      render json: @cartao.errors, status: :unprocessable_entity
    end
  end


  def destroy_cartao
    @cartao.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_user
      @normal_user = NormalUser.find(params[:id])
    end

    def set_car
      @car = Car.find(params[:id])
    end

    def set_cartao
      @cartao = Card.find(params[:id])
    end


  # Only allow a trusted parameter "white list" through.
    def normal_user_params
      params.require(:normal_user).permit(:points, :user_id)
    end

    def car_params
      params.permit(:marca, :modelo, :cor, :placa, :normal_user_id)
    end

    def cartao_params
      params.permit(:numero, :titular, :normal_user_id)
    end
end
