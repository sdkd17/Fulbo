class CreatePartidos < ActiveRecord::Migration[5.1]
  def change
    create_table :partidos do |t|
      t.references :user, foreign_key: true
      t.string :lugar
      t.datetime :fecha

      t.timestamps
    end
  end
end
