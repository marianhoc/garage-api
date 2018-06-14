class RemoveStatusFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :status, :string
  end
end
