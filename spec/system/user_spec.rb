require 'rails_helper'
RSpec.describe 'ユーザー登録機能', type: :system do
  describe 'メールアドレスによるユーザー新規登録' do
    context '必要情報を入力し、アカウントを登録した場合' do
      it '本人確認用のメールを送信しました。と表示される' do
        visit new_user_registration_path
        fill_in '名前', with: 'test'
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        fill_in '確認用パスワード', with: 'test@test.com'
        click_on 'アカウント登録'
        expect(page).to have_content '本人確認用のメールを送信しました。'
      end
    end
  end
end
