class CreateOperadorEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :operador_estacionamentos do |t|
      t.references :user, foreign_key: true
      t.references :estacionamento, foreign_key: true
      t.string :cpf

      t.timestamps
    end
  end
end
