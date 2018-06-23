class CreateEstacionamentosFavoritos < ActiveRecord::Migration[5.1]
  def change
    create_table :estacionamentos_favoritos do |t|
      t.references :normal_user, foreign_key: true
      t.references :estacionamento, foreign_key: true

      t.timestamps
    end
  end
end
