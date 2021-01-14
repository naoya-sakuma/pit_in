class AddColumnsToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :day_to_finish, :date
  end
end
