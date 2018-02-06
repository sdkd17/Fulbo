class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :court, foreign_key: true
      t.references :partido, foreign_key: true

      t.timestamps
    end
  end
end
