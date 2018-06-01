class AddFieldsToEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :estacionamentos, :primeira_hora, :float
    add_column :estacionamentos, :hora, :float
    add_column :estacionamentos, :mensal, :float
  end
end
