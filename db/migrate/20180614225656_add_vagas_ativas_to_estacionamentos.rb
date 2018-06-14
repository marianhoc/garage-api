class AddVagasAtivasToEstacionamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :estacionamentos, :vagas_ativas, :integer, default: 10
  end
end
