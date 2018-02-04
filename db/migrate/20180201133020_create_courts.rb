class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.integer :precio
      t.references :local, foreign_key: true

      t.timestamps
    end
  end
end
