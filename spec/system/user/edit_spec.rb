# bundle exec rspec spec/system/user/edit_spec.rb

require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe 'ユーザー編集機能' do
    context 'マイページでユーザー情報の編集に成功した場合' do
      it 'マイページに編集が反映される' do
        @user = FactoryBot.create(:user)
        #@user.skip_confirmation!
        @user.save!
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        click_button 'ログイン'
        click_on 'テストユーザー'
        click_on 'マイページ'
        click_on '編集'
        fill_in '名前', with: 'テストユーザー2'
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in '現在のパスワード', with: 'test@test.com'
        click_on '更新'
        expect(page).to have_content 'テストユーザー'
      end
    end
    context 'マイページ編集後、パスワードを入力せずに編集ボタンを押した場合' do
      it '編集できない' do
        @user = FactoryBot.create(:user)
        #@user.skip_confirmation!
        @user.save!
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        click_button 'ログイン'
        click_on 'テストユーザー'
        click_on 'マイページ'
        click_on '編集'
        click_on '更新'
        fill_in '名前', with: 'テストユーザー2'
        fill_in 'メールアドレス', with: 'test@test.com'
        click_on '更新'
        expect(page).not_to have_content "%現在のパスワードを入力してください%"
      end
    end
  end
end
