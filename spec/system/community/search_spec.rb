# bundle exec rspec spec/system/community/search_spec.rb

require 'rails_helper'
RSpec.describe 'コミュニティ関連機能', type: :system do
  describe 'コミュニティ一覧検索' do
    before do
      community = FactoryBot.create(:community)
      second_community = FactoryBot.create(:second_community)
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context '合致するコミュニティがあるワードで検索した場合' do
      it '合致したコミュニティが表示される' do
        visit communities_path
        fill_in "q_title_cont", with: "テストコミュニティ1"
        click_on "検索"
        expect(page).to have_content "テストコミュニティ1"
      end
    end
    context '検索ワードに合致しないコミュニティと合致するコミュニティがある場合' do
      it '合致しないコミュニティは表示されない' do
        visit communities_path
        fill_in "q_title_cont", with: "テストコミュニティ1"
        click_on "検索"
        expect(page).not_to have_content "テストコミュニティ2"
      end
    end
    context '検索ワードに合致するコミュニティが存在しない場合' do
      it '「検索ワード」をタイトルに含むコミュニティはありません。と表示される' do
        visit communities_path
        fill_in "q_title_cont", with: "合致しないワード"
        click_on "検索"
        expect(page).not_to have_content '\n「合致しないワード」をタイトルに含むコミュニティはありません。'
      end
    end
  end
end
