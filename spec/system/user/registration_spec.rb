# bundle exec rspec spec/system/user/registration_spec.rb

require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe 'メールアドレスによるユーザー新規登録' do
    context 'メールアドレスを入力せずに登録した場合' do
      it 'エラーが発生し、メールアドレスを入力してくださいと表示される' do
        visit root_path
        fill_in '名前', with: 'テストユーザー'
        fill_in 'パスワード', with: 'test@test.com'
        fill_in '確認用パスワード', with: 'test@test.com'
        click_on 'アカウント登録'
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end
    context 'パスワードを入力せずに登録した場合' do
      it 'エラーが発生し、パスワードを入力してくださいと表示される' do
        visit root_path
        fill_in '名前', with: 'テストユーザー'
        fill_in 'メールアドレス', with: 'test@test.com'
        click_on 'アカウント登録'
        expect(page).to have_content 'パスワードを入力してください'
      end
    end
  end
end
