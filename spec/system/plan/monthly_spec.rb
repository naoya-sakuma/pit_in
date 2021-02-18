# bundle exec rspec spec/system/plan/monthly_spec.rb

require 'rails_helper'
RSpec.describe '計画機能', type: :system do
  describe '今月の計画' do
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
    end
    context '一覧ページを見た場合' do
      it '取組中の目標が表示される' do
        visit monthly_plans_path
        expect(page).to have_content "テスト1"
      end
    end
    context '一覧ページを見た場合' do
      it '取組中以外の目標は表示されない' do
        visit monthly_plans_path
        expect(page).not_to have_content "テスト2"
      end
    end
  end
end
