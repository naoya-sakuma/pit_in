# bundle exec rspec spec/models/community_spec.rb

require 'rails_helper'
RSpec.describe Community, type: :model do
  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかる' do
        community = Community.new(title: '')
        expect(community).not_to be_valid
      end
    end
  end
end
