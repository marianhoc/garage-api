class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :normal_user, foreign_key: true
      t.string :numero
      t.string :titular

      t.timestamps
    end
  end
end
