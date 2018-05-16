class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.references :normal_user, foreign_key: true
      t.bigint :value

      t.timestamps
    end
  end
end
