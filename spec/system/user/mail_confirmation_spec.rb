# bundle exec rspec spec/system/user/mail_confirmation_spec.rb

require 'rails_helper'
RSpec.describe 'ユーザー登録機能', type: :system do
  describe 'メールアドレスによるユーザー新規登録' do
    # context '必要情報を入力し、アカウントを登録した場合' do
    #   it '本人確認用のメールを送信しました。と表示される' do
    #     visit root_path
    #     fill_in '名前', with: 'テストユーザー'
    #     fill_in 'メールアドレス', with: 'test@test.com'
    #     fill_in 'パスワード', with: 'test@test.com'
    #     fill_in '確認用パスワード', with: 'test@test.com'
    #     click_on 'アカウント登録'
    #     expect(page).to have_content '本人確認用のメールを送信しました。'
    #   end
    # end
    # context '必要情報を入力し、アカウントを登録した場合' do
    #   it '本人確認用のメールが送信される' do
    #     visit root_path
    #     fill_in '名前', with: 'テストユーザー'
    #     fill_in 'メールアドレス', with: 'test@test.com'
    #     fill_in 'パスワード', with: 'test@test.com'
    #     fill_in '確認用パスワード', with: 'test@test.com'
    #     expect { click_button 'アカウント登録' }.to change { ActionMailer::Base.deliveries.size }.by(1)
    #   end
    # end
  end
end
