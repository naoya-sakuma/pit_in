class RenameTermColumnInGoals < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :term, :day_to_start
  end
end
