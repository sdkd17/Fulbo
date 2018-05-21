class AddIndexToPartidos < ActiveRecord::Migration[5.1]
  def change
  	  	add_index :partidos, [:local_id, :court_id, :fecha],  unique: true
  end
end
