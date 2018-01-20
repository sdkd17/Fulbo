class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nick
      t.string :password
      t.string :nombre
      t.string :apellido
      t.date :nacimiento
      t.text :descripcion
      t.integer :calificacion

      t.timestamps
    end
  end
end
