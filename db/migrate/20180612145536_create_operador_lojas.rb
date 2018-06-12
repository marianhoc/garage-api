class CreateOperadorLojas < ActiveRecord::Migration[5.1]
  def change
    create_table :operador_lojas do |t|
      t.references :user, foreign_key: true
      t.references :loja, foreign_key: true
      t.string :cpf

      t.timestamps
    end
  end
end
