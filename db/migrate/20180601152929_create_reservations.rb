class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :normal_user, foreign_key: true
      t.references :estacionamento, foreign_key: true      
      t.string :status
      t.boolean :car_at_vacancy
      t.datetime :programming_date
      t.time :expected_time_at_vacancy
      t.time :real_time_at_vacancy
      t.float :tax_value
      t.float :total_value
      t.string :payment
      t.boolean :creditos_pare_mais

      t.timestamps
    end
  end
end
