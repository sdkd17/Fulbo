class AddUserToLocals < ActiveRecord::Migration[5.1]
  def change
    add_reference :locals, :user, foreign_key: true
  end
end
