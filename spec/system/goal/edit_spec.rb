# bundle exec rspec spec/system/goal/edit_spec.rb

require 'rails_helper'
RSpec.describe '目標関連機能', type: :system do
  describe '目標の編集' do
    before do
      user = FactoryBot.create(:user)
      #user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
      visit new_goal_path
      fill_in 'タイトル', with: 'テストタイトル'
      fill_in 'problem_form', with: 'テスト課題'
      click_on '保存'
      click_on '編集'
    end
    context '目標のタイトルを変更した場合' do
      it '目標タイトルが変更される' do
        fill_in 'タイトル', with: '変更後のテスト目標タイトル'
        click_on '保存'
        expect(page).to have_content '変更後のテスト目標タイトル'
      end
    end

    context '目標に紐づく問題タイトルを変更した場合' do
      it '変更が反映される' do
        fill_in 'problem_form', with: '変更後のテスト課題'
        click_on '保存'
        click_on '詳細'
        expect(page).to have_content '変更後のテスト課題'
      end
    end
  end
end
