class ChangeColumnNameOnTables < ActiveRecord::Migration[5.2]
  def change
    rename_column :problems, :done, :status
    rename_column :solutions, :done, :status
    rename_column :tasks, :done, :status
    rename_column :steps, :done, :status

    remove_column :solutions, :working, :string
    remove_column :tasks, :working, :string
    remove_column :steps, :working, :string
  end
end
