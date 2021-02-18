class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :isolated_steps
    drop_table :shared_goals
  end
end
