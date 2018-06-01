require 'test_helper'

class VacanciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacancy = vacancies(:one)
  end

  test "should get index" do
    get vacancies_url, as: :json
    assert_response :success
  end

  test "should create vacancy" do
    assert_difference('Vacancy.count') do
      post vacancies_url, params: { vacancy: { estacionamento_id: @vacancy.estacionamento_id, normal_user_id: @vacancy.normal_user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show vacancy" do
    get vacancy_url(@vacancy), as: :json
    assert_response :success
  end

  test "should update vacancy" do
    patch vacancy_url(@vacancy), params: { vacancy: { estacionamento_id: @vacancy.estacionamento_id, normal_user_id: @vacancy.normal_user_id } }, as: :json
    assert_response 200
  end

  test "should destroy vacancy" do
    assert_difference('Vacancy.count', -1) do
      delete vacancy_url(@vacancy), as: :json
    end

    assert_response 204
  end
end
