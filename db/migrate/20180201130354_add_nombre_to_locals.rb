class AddNombreToLocals < ActiveRecord::Migration[5.1]
  def change
    add_column :locals, :nombre, :string
  end
end
