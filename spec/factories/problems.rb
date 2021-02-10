FactoryBot.define do
  factory :problem do
    title { "テスト問題" }
    status { "取組中" }

    association :goal
  end
end
