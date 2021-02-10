class ChangeDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :problems, :status, from: '保留中', to: '未解決'
  end
end
