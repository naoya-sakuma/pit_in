# bundle exec rspec spec/system/goal/share_and_add_spec.rb

require 'rails_helper'
RSpec.describe '目標関連機能', type: :system do
  describe '目標公開機能' do
    before do
      user = FactoryBot.create(:user)
      goal = FactoryBot.create(:goal, user: user)
      goal = FactoryBot.create(:second_goal, user: user)
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
    context '目標の公開状況を公開に設定した場合' do
      it '公開目標の一覧に表示される' do
        fill_in 'タイトル', with: '変更後のテスト目標タイトル'
        click_on '保存'
        expect(page).to have_content '変更後のテスト目標タイトル'
      end
    end
  end
end
