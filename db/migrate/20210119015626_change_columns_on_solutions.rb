class ChangeColumnsOnSolutions < ActiveRecord::Migration[5.2]
  def change
    remove_column :solutions, :day_to_start, :date
    rename_column :solutions, :day_to_finish, :working
    change_column :solutions, :working, :string
    rename_column :solutions, :status, :done
  end
end
