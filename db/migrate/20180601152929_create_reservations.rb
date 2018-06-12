class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :normal_user, foreign_key: true
      t.references :estacionamento, foreign_key: true      
      t.string :status
      t.boolean :car_at_vacancy
      t.datetime :programming_date_begin
      t.datetime :programming_date_end
      t.integer :expected_time_at_vacancy
      t.integer :real_time_at_vacancy
      t.decimal :total_value, precision: 15, scale: 3
      t.string :payment
      t.boolean :creditos_pare_mais
      t.decimal :estacionamento_hora, precision: 15, scale: 3
      t.decimal :estacionamento_primeira_hora, precision: 15, scale: 3
      t.decimal :estacionamento_taxa, precision: 15, scale: 3

      t.timestamps
    end
  end
end
