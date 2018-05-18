class AddPlacaToNormalUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :normal_users, :placa, :string
  end
end
