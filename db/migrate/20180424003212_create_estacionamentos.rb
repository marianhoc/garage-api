class CreateEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :estacionamentos do |t|
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :razao_social
      t.string :cnpj
      t.string :latitude
      t.string :longitude
      t.integer :total_vagas
      t.string :agencia
      t.string :conta

      t.timestamps
    end
  end
end
