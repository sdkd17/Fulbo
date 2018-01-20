class AddAceptadoToAnotado < ActiveRecord::Migration[5.1]
  def change
  	add_column :anotados, :aceptado, :boolean
  end
end
