class AddCarsToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :car, foreign_key: true
  end
end
