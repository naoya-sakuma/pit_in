class ChangeProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :working, :string
    rename_column :problems, :status, :done
  end
end
