class AddDefaultToNicknameOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :nickname, '未登録'
  end
end
