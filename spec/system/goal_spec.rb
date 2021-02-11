# rspec spec/system/goal_spec.rb

require 'rails_helper'
RSpec.describe '目標作成機能', type: :system do
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
        expect(page).to have_content 'Titleを入力してください'
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
