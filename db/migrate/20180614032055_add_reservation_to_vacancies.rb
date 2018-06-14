class AddReservationToVacancies < ActiveRecord::Migration[5.1]
  def change
    add_reference :vacancies, :reservation, foreign_key: true
  end
end
