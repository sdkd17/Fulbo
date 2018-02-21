class AddCourtToPartidos < ActiveRecord::Migration[5.1]
  def change
    add_column :partidos, :court_id, :integer
  end
end
