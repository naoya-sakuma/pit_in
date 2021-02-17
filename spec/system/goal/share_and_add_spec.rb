# bundle exec rspec spec/system/goal/share_and_add_spec.rb

require 'rails_helper'
RSpec.describe '目標関連機能', type: :system do
  describe '目標公開機能' do
    before do
      user = FactoryBot.create(:user)
      goal = FactoryBot.create(:goal, user: user)
      goal = FactoryBot.create(:third_goal, user: user)
      #user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context '目標の公開状況を公開に設定した場合' do
      it '公開目標の一覧に表示される' do
        visit shared_goals_path
        expect(page).to have_content 'テスト1'
      end
    end
    context '目標の公開状況を非公開に設定した場合' do
      it '公開目標の一覧に表示されない' do
        visit shared_goals_path
        expect(page).not_to have_content 'テスト3'
      end
    end
  end
end
