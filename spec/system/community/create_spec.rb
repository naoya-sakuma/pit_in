# bundle exec rspec spec/system/community/create_spec.rb

require 'rails_helper'
RSpec.describe 'コミュニティ関連機能', type: :system do
  describe 'コミュニティの新規作成' do
    before do
      community = FactoryBot.create(:community)
      second_community = FactoryBot.create(:second_community)
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context 'コミュニティを作成したユーザーでログインしている場合' do
      it '作成したコミュニティ欄にそのコミュニティが表示される' do
        visit management_communities_path
        within(".onw_comunity_index") do
          expect(page).to have_content "テストコミュニティ1"
        end
      end
    end
    context 'タイトルを入力せずにコミュニティを作成した場合' do
      it 'タイトルを入力してくださいと表示される' do
        visit new_community_path
        fill_in "概要", with: "テスト用コミュニティの概要"
        click_on "保存"
        expect(page).to have_content "タイトルを入力してください"
      end
    end
    context 'コミュニティを作成した場合' do
      it 'コミュニティ一覧に表示される' do
        visit new_community_path
        fill_in "タイトル", with: "テスト用コミュニティ"
        fill_in "概要", with: "テスト用コミュニティの概要"
        click_on "保存"
        within(".onw_comunity_index") do
          expect(page).to have_content "テスト用コミュニティ"
        end
      end
    end
    context '他のユーザーがコミュニティを作成している場合' do
      it '作成したコミュニティに表示されない' do
        visit management_communities_path
        within(".onw_comunity_index") do
          expect(page).not_to have_content "テストコミュニティ2"
        end
      end
    end
    context '他のユーザーがコミュニティを作成した場合' do
      it 'コミュニティ一覧に表示される' do
        visit communities_path
        expect(page).to have_content "テストコミュニティ2"
      end
    end
  end
end
