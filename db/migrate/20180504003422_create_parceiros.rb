class CreateParceiros < ActiveRecord::Migration[5.1]
  def change
    create_table :parceiros do |t|
      t.string :nome
      t.string :cnpj
      t.string :telefone

      t.timestamps
    end
  end
end
