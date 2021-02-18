# bundle exec rspec spec/system/comment/comment_spec.rb

require 'rails_helper'
RSpec.describe 'コメント関連機能', type: :system do
  describe 'コミュニティの新規投稿' do
    before do
      community = FactoryBot.create(:community)
      second_community = FactoryBot.create(:second_community)
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context 'コミュニティ作成者がコメントした場合' do
      it '投稿できる' do
        visit community_management_communities_path
        click_on "詳細", match: :first
        fill_in "comment_content", with: "テストコメント"
        click_on "投稿"
        expect(page).to have_content "テストコメント"
      end
    end
  end
end
