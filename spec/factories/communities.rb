FactoryBot.define do
  factory :community do
    title { 'テストコミュニティ1' }
    summary { 'テストコミュニティ1の概要' }
    association :user
  end

  factory :second_community, class: Community do
    title { 'テストコミュニティ2' }
    summary { 'テストコミュニティ2の概要' }
    association :user, factory: :second_user
  end
end
