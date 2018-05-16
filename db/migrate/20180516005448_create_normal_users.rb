class CreateNormalUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :normal_users do |t|
      t.bigint :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
