class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.references :normal_user, foreign_key: true
      t.string :cor
      t.string :placa
      t.string :modelo
      t.string :marca

      t.timestamps
    end
  end
end
