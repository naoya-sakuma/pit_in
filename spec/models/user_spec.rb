# rspec spec/models/user_spec.rb

require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
      it 'バリデーションにかかる' do
        user = User.new(name: '', email: 'test@test.com', password: 'testtest')
        expect(user).not_to be_valid
      end
    end
    context 'emailが空の場合' do
      it 'バリデーションかかる' do
        user = User.new(name: 'テストユーザー', email: '', password: 'testtest')
        expect(user).not_to be_valid
      end
    end
    context 'passwordが空の場合' do
      it 'バリデーションにかかる' do
        user = User.new(name: 'テストユーザー', email: 'test@test.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context 'passwordが5文字以下の場合' do
      it 'バリデーションにかかる' do
        user = User.new(name: 'テストユーザー', email: 'test@test.com', password: 'abcde')
        expect(user).not_to be_valid
      end
    end

    context 'passwordが8文字以上の場合' do
      it 'バリデーションに通る' do
        user = User.new(name: 'テストユーザー', email: 'test@test.com', password: 'abcdefgh')
        expect(user).to be_valid
      end
    end

    context 'name, email, passwordが入力されている場合' do
      it 'バリデーションに通る' do
        user = User.new(name: 'テストユーザー', email: 'test@test.com', password: 'testtest')
        expect(user).to be_valid
      end
    end
    context '重複したメールアドレスが登録されようとした場合' do
      it 'バリデーションにかかる' do
        user = FactoryBot.create(:user)
        user = User.new(name: 'テストユーザー', email: 'test@test.com', password: 'testtest')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーが退会した場合' do
      it '退会したユーザーの情報は削除される' do
        user = FactoryBot.create(:user)
        user.destroy
        user = User.new(name: 'テストユーザー', email: 'test@test.com', password: 'testtest')
        expect(user).to be_valid
      end
    end
  end
end
