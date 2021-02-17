# bundle exec rspec spec/system/user/login_spec.rb

require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe 'ログイン機能' do
    context 'メールアドレスでログインした場合' do
      it 'マイページにアクセスする' do
        @user = FactoryBot.create(:user)
        #@user.skip_confirmation!
        @user.save!
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        click_button 'ログイン'
        expect(page).to have_content 'テストユーザー'
      end
    end
    context 'ログアウトを押した場合' do
      it 'アカウント登録ページに戻る' do
        @user = FactoryBot.create(:user)
        #@user.skip_confirmation!
        @user.save!
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        click_button 'ログイン'
        click_on 'ログアウト'
        expect(page).to have_content 'アカウント登録'
      end
    end
  end
end
