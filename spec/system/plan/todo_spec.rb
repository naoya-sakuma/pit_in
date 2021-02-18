# bundle exec rspec spec/system/plan/todo_spec.rb

require 'rails_helper'
RSpec.describe '計画機能', type: :system do
  describe 'ToDo' do
    before do
      user = FactoryBot.create(:user)
      goal = FactoryBot.create(:goal, user: user)
      problem = FactoryBot.create(:problem, goal: goal)
      solution = FactoryBot.create(:solution, problem: problem)
      task = FactoryBot.create(:task, solution: solution)
      step = FactoryBot.create(:step, task: task)
      step = FactoryBot.create(:second_step, task: task)
      #user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context '一覧ページを見た場合' do
      it '取組中のステップが表示される' do
        visit today_jobs_path
        expect(page).to have_content "取組中のテストステップ"
      end
    end
    context '一覧ページを見た場合' do
      it '保留中のステップは表示されない' do
        visit today_jobs_path
        expect(page).not_to have_content "保留中のテストステップ"
      end
    end
  end
end
