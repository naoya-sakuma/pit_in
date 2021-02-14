class AddNicknameColumnToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :author, :string, unique: true
    add_index :goals, :author, unique: true
  end
end
