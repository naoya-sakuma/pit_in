# bundle exec rspec spec/system/community/edit_spec.rb

require 'rails_helper'
RSpec.describe 'コミュニティ関連機能', type: :system do
  describe 'コミュニティの編集' do
    before do
      community = FactoryBot.create(:community)
      second_community = FactoryBot.create(:second_community)
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context 'コミュニティを編集した場合' do
      it '編集内容が反映される' do
        visit management_communities_path
        click_on "編集", match: :first
        fill_in "タイトル", with: "編集されたテストコミュニティ1"
        click_on "保存"
        expect(page).to have_content "編集されたテストコミュニティ1"
      end
    end
    context 'コミュニティ編集時、タイトルなしで保存した場合' do
      it 'タイトルを入力してくださいと表示される' do
        visit management_communities_path
        click_on "編集", match: :first
        fill_in "タイトル", with: ""
        click_on "保存"
        expect(page).to have_content "タイトルを入力してください"
      end
    end
  end
end
