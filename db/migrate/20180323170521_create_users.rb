class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
     t.string :name
     t.string :cpf
     t.date :birth
     t.integer :tel
     t.timestamps
    end
  end
end
