class AddLatitudeLongitudeEstacionamento < ActiveRecord::Migration[5.1]
  def change
    add_column :estacionamentos, :latitude, :string
    add_column :estacionamentos, :longitude, :string
    
  end
end
