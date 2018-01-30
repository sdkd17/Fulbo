class CreateLocals < ActiveRecord::Migration[5.1]
  def change
    create_table :locals do |t|
      t.string :barrio
      t.string :direccion
      t.string :telefono
      t.string :email
      t.time :opens
      t.time :closes

      t.timestamps
    end
  end
end
