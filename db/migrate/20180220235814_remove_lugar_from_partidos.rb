class RemoveLugarFromPartidos < ActiveRecord::Migration[5.1]
  def change
    remove_column :partidos, :lugar, :string
  end
end
