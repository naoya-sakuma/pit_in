# bundle exec rspec spec/system/goal/create_spec.rb

require 'rails_helper'
RSpec.describe '目標関連機能', type: :system do
  describe '目標の新規作成' do
    before do
      user = FactoryBot.create(:user)
      #user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context 'タイトルなしで登録した場合' do
      it 'Titleを入力してください。と表示される' do
        visit new_goal_path
        click_on '保存'
        expect(page).to have_content 'タイトルを入力してください'
      end
    end

    context 'タイトルありで登録した場合' do
      it '登録した目標が目標一覧に表示される' do
        visit new_goal_path
        fill_in 'タイトル', with: 'テストタイトル'
        click_on '保存'
        expect(page).to have_content 'テストタイトル'
      end
    end
    context '状態で取組中を選んで登録した場合' do
      it '目標一覧で取組中と表示される' do
        visit new_goal_path
        fill_in 'タイトル', with: 'テストタイトル'
        select '取組中', from: '状態'
        click_on '作成'
        expect(page).to have_content '取組中'
      end
    end

    context '状態で保留中を選んで登録した場合' do
      it '目標一覧で取組中と表示される' do
        visit new_goal_path
        fill_in 'タイトル', with: 'テストタイトル'
        select '保留中', from: '状態'
        click_on '作成'
        expect(page).to have_content '保留中'
      end
    end

    context '目標と一緒に問題を登録した場合' do
      it '目標詳細画面で問題が表示される' do
        visit new_goal_path
        fill_in 'タイトル', with: 'テストタイトル'
        fill_in 'problem_form', with: 'テスト課題'
        click_on '保存'
        click_on '詳細'
        expect(page).to have_content 'テスト課題'
      end
    end
  end
end
