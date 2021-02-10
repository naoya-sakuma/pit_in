# rspec spec/models/goal_spec.rb

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかる' do
        goal = Goal.new(title: '')
        expect(goal).not_to be_valid
      end
    end
    context 'タイトルが入力されている場合' do
      it 'バリデーションに通る' do
        user = FactoryBot.create(:user)
        goal = FactoryBot.create(:goal, user: user)
        expect(goal).to be_valid
      end
    end
  end
end
