class AddCpfToNormalUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :normal_users, :cpf, :string
  end
end
