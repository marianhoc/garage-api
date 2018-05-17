class CreateLojas < ActiveRecord::Migration[5.1]
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :endereco
      t.string :latitude
      t.string :longitude
      t.string :cnpj

      t.timestamps
    end
  end
end
