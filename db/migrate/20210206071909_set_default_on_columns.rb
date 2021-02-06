class SetDefaultOnColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :problems, :status, :string, default: '保留中'
    change_column :solutions, :status, :string, default: '保留中'
    change_column :tasks, :status, :string, default: '保留中'
    change_column :steps, :status, :string, default: '保留中'
  end
end
