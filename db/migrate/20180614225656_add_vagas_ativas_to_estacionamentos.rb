class AddVagasAtivasToEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :estacionamentos, :vagas_ativas, :integer, default: 0
    add_column :estacionamentos, :vagas_ocupadas, :integer, default: 0
  end
end
