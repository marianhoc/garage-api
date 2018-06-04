class AddDonoToEstacionamento < ActiveRecord::Migration[5.1]
  def change
    add_reference :estacionamentos, :dono_estacionamentos, foreign_key: true
  end
end
