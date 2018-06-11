class AddFieldsToEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :estacionamentos, :primeira_hora, :decimal, precision: 15, scale: 3
    add_column :estacionamentos, :hora, :decimal, precision: 15, scale: 3
    add_column :estacionamentos, :mensal, :decimal, precision: 15, scale: 3
    add_column :estacionamentos, :valor_vaga, :decimal, precision: 15, scale: 3
    add_column :estacionamentos, :taxa_reserva, :decimal, precision: 15, scale: 3
  end
end
