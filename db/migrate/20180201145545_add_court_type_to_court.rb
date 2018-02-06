class AddCourtTypeToCourt < ActiveRecord::Migration[5.1]
  def change
    add_column :courts, :court_type, :integer
  end
end
