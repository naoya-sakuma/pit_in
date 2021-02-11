class AddDefaultToStatusOnGoals < ActiveRecord::Migration[5.2]
  def change
    change_column_default :goals, :status, from: 'f', to: '保留中'
    remove_column :problems, :working, :string
  end
end
