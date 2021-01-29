class ChangeTasksAndSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :working, :string
    rename_column :tasks, :status, :done
    add_column :steps, :working, :string
    rename_column :steps, :status, :done
  end
end
