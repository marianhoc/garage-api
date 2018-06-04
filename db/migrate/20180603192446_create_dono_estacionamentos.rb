class CreateDonoEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :dono_estacionamentos do |t|
      t.references :user, foreign_key: true
      t.string :cpf

      t.timestamps
    end
  end
end
