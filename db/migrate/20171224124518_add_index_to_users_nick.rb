class AddIndexToUsersNick < ActiveRecord::Migration[5.1]
  def change
  	add_index :users, :nick, unique: true
  end
end
