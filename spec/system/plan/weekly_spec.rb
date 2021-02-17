# bundle exec rspec spec/system/plan/weekly_spec.rb

require 'rails_helper'
RSpec.describe '計画機能', type: :system do
  describe '今週の計画' do
    before do
      user = FactoryBot.create(:user)
      goal = FactoryBot.create(:goal, user: user)
      problem = FactoryBot.create(:problem, goal: goal)
      solution = FactoryBot.create(:solution, problem: problem)
      solution = FactoryBot.create(:second_solution, problem: problem)
      #user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context '一覧ページを見た場合' do
      it '取組中の解決案が表示される' do
        visit weekly_plans_path
        expect(page).to have_content "取組中のテスト解決案"
      end
    end
    context '一覧ページを見た場合' do
      it '保留中の解決案は表示されない' do
        visit weekly_plans_path
        expect(page).not_to have_content "保留中のテスト解決案"
      end
    end
  end
end
