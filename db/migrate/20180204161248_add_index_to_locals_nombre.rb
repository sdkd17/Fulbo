class AddIndexToLocalsNombre < ActiveRecord::Migration[5.1]
  def change
  	add_index :locals, :nombre, unique: true
  end
end
