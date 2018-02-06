class AddFechaToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :fecha, :date
  end
end
