require 'rails_helper'
RSpec.describe 'ユーザー登録機能', type: :system do
  describe 'メールアドレスによるユーザー新規登録' do
    context '必要情報を入力し、アカウントを登録した場合' do
      it '本人確認用のメールを送信しました。と表示される' do
        visit root_path
        fill_in '名前', with: 'テストユーザー'
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        fill_in '確認用パスワード', with: 'test@test.com'
        click_on 'アカウント登録'
        expect(page).to have_content '本人確認用のメールを送信しました。'
      end
    end
    context '必要情報を入力し、アカウントを登録した場合' do
      it '本人確認用のメールが送信される' do
        visit root_path
        fill_in '名前', with: 'テストユーザー'
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        fill_in '確認用パスワード', with: 'test@test.com'
        expect { click_button 'アカウント登録' }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end
    end
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

  describe 'ログイン機能' do
    context 'メールアドレスでログインした場合' do
      it 'マイページにアクセスする' do
        @user = FactoryBot.create(:user)
        @user.skip_confirmation!
        @user.save!
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'test@test.com'
        click_button 'ログイン'
        expect(page).to have_content 'テストユーザー'
      end
    end
    context 'Googleアカウントでログインした場合' do
      it 'ログイン状態になる' do

      end
    end
  end

  describe 'ユーザー編集機能' do
    context 'マイページでユーザー情報を編集した場合' do
      it 'マイページに編集が反映される' do
        
      end
    end
  end
end
