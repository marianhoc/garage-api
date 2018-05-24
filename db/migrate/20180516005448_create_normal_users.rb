class CreateNormalUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :normal_users do |t|
      t.bigint :balance, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
