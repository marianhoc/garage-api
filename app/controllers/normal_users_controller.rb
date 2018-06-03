class NormalUsersController < ApplicationController
  before_action :set_normal_user, only: [:show, :update, :destroy]

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
    puts " = = = = = = = = = = = = SAVE CAR  FOI  = = = = = = == = = = = = = == = = "

    @car = Car.new(car_params)

    puts @car.marca
    puts @car.modelo

    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end

  end

  def destroy_car
    #TODO
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_user
      @normal_user = NormalUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def normal_user_params
      params.require(:normal_user).permit(:points, :user_id)
    end

    def car_params
      params.permit(:marca, :modelo, :cor, :placa, :normal_user_id)
    end

end
