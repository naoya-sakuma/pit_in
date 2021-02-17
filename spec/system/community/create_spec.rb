require 'rails_helper'
RSpec.describe 'コミュニティ関連機能', type: :system do
  describe 'コミュニティの新規作成' do
    before do
      user = FactoryBot.create(:user)
      #user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'test@test.com'
      click_button 'ログイン'
    end
    context 'コミュニティを作成したユーザーでログインしている場合' do
      it '作成したコミュニティ欄にそのコミュニティが表示される' do
      end
    end
    context 'コミュニティを作成した場合' do
      it 'コミュニティ一覧に表示される' do
      end
    end
    context '他のユーザーがコミュニティを作成した場合' do
      it '作成したコミュニティに表示されない' do
      end
    end
    context '他のユーザーがコミュニティを作成した場合' do
      it 'コミュニティ一覧に表示される' do
      end
    end
    context 'タイトルなしでコミュニティを作成した場合' do
      it 'タイトルを入力してくださいと表示される' do
      end
    end
  end
end
