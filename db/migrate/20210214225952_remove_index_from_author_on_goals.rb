class RemoveIndexFromAuthorOnGoals < ActiveRecord::Migration[5.2]
  def change
    remove_index :goals, column: :author
  end
end
