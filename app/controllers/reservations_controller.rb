class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  def normal_user_reservations
    @reservations = Reservation.where(normal_user_id: params[:normal_user_id])

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    car = Car.find_by(placa: params[:placa])
    reservation_params.delete(:placa)
    @reservation = Reservation.new(reservation_params)
    @reservation.car_id = car.id
    @reservation.programming_date = Time.zone.now if !reservation_params[:programming_date]
    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    car = Car.find_by(placa: params[:placa])
    reservation_params.delete(:placa)
    @reservation.car_id = car.id
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:normal_user_id, :placa, :estacionamento_id, :payment, :creditos_pare_mais)
    end
end
