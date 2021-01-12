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
    context '必要情報を入力し、アカウントを登録した場合' do
      it '本人確認用のメールが送信される' do
        
      end
    end
    context '本人確認メールで本人確認が完了した場合' do
      it 'ユーザー情報が登録される' do

      end
    end
    context 'メールアドレスを入力せずに登録した場合' do
      it 'エラーが発生し、メールアドレスを入力してくださいと表示される' do
        visit new_user_registration_path
        fill_in '名前', with: 'test'
        fill_in 'パスワード', with: 'test@test.com'
        fill_in '確認用パスワード', with: 'test@test.com'
        click_on 'アカウント登録'
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end
    context 'パスワードを入力せずに登録した場合' do
      it 'エラーが発生し、パスワードを入力してくださいと表示される' do

      end
    end
  end

  describe 'Googleアカウントログイン機能' do
    context '' do
      it '' do

      end
    end
  end

  describe 'セッション機能' do
    context 'ユーザーがログインした場合' do
      it 'ログイン状態になる' do

      end
    end
  end
end
