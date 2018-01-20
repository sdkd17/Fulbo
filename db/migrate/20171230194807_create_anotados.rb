class CreateAnotados < ActiveRecord::Migration[5.1]
  def change
    create_table :anotados do |t|
      t.integer :user_id, foreign_key: true
      t.integer :partido_id, foreign_key: true

      t.timestamps
    end
    
    add_index :anotados, :user_id
    add_index :anotados, :partido_id
    add_index :anotados, [:user_id, :partido_id], unique: true
  end
end
