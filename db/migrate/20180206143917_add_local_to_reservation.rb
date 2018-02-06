class AddLocalToReservation < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :local, foreign_key: true
  end
end
