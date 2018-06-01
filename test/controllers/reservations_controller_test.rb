require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url, as: :json
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { car_at_vacancy: @reservation.car_at_vacancy, estacionamento_id: @reservation.estacionamento_id, normal_user_id: @reservation.normal_user_id, programming_date: @reservation.programming_date, status: @reservation.status, tax_value: @reservation.tax_value, time_at_vacancy: @reservation.time_at_vacancy, total_value: @reservation.total_value } }, as: :json
    end

    assert_response 201
  end

  test "should show reservation" do
    get reservation_url(@reservation), as: :json
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { car_at_vacancy: @reservation.car_at_vacancy, estacionamento_id: @reservation.estacionamento_id, normal_user_id: @reservation.normal_user_id, programming_date: @reservation.programming_date, status: @reservation.status, tax_value: @reservation.tax_value, time_at_vacancy: @reservation.time_at_vacancy, total_value: @reservation.total_value } }, as: :json
    assert_response 200
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation), as: :json
    end

    assert_response 204
  end
end
