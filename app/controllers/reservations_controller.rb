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

  def estacionamento_reservations
    estacionamento = Estacionamento.find_by(id: OperadorEstacionamento.find(params[:operador_estacionamento_id]))
    @reservations = Reservation.where(estacionamento_id: estacionamento.id)

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

    reservation_day = ""
    reservation_month = ""
    reservation_hour = ""
    reservation_minute = ""
    programming_reservation = false

    if params[:expected_entry_time_at_vacancy] && params[:expected_entry_time_at_vacancy] != ""
      reservation_hour = params[:expected_entry_time_at_vacancy][:hour]
      reservation_minute = params[:expected_entry_time_at_vacancy][:minute]
      if params[:day] && params[:day] != ""
        reservation_day = params[:day]
        reservation_month = params[:month]
        programming_reservation = true
      end
    end

    @reservation = Reservation.new(reservation_params)
    @reservation.car_id = car.id

    if programming_reservation
      @reservation.programming_date_begin = DateTime.new(
        Time.now.year, reservation_month.to_i, 
        reservation_day.to_i, reservation_hour.to_i,
        reservation_minute.to_i, 0)
    else
      @reservation.programming_date_begin = DateTime.now
    end

    @reservation.set_programming_date_end()

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
      reservation_day = ""
      reservation_month = ""
      reservation_hour = ""
      reservation_minute = ""
      programming_reservation = false

      if params[:expected_entry_time_at_vacancy] && params[:expected_entry_time_at_vacancy] != ""
        reservation_hour = params[:expected_entry_time_at_vacancy][:hour]
        reservation_minute = params[:expected_entry_time_at_vacancy][:minute]
        if params[:day] && params[:day] != ""
          reservation_day = params[:day]
          reservation_month = params[:month]
          programming_reservation = true
        end
      end

      @reservation = Reservation.new(reservation_params)
      @reservation.car_id = car.id

      if programming_reservation
        @reservation.programming_date_begin = DateTime.new(
          Time.now.year, reservation_month.to_i, 
          reservation_day.to_i, reservation_hour.to_i,
          reservation_minute.to_i, 0)
      else
        @reservation.programming_date_begin = DateTime.now
      end

      @reservation.set_programming_date_end()
      @reservation.save
      
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
      params.require(:reservation)
        .permit(
          :normal_user_id, 
          :placa, 
          :estacionamento_id, 
          :payment, 
          :creditos_pare_mais,
          :programming_date_begin,
          :programming_date_end,
          :expected_time_at_vacancy,
          :total_value,
          :estacionamento_taxa,
          :estacionamento_primeira_hora,
          :estacionamento_hora)
    end
end
