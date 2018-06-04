class AddAbertoToEstacionamento < ActiveRecord::Migration[5.1]
  def change
    add_column :estacionamentos, :aberto, :boolean
  end
end
