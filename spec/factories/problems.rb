FactoryBot.define do
  factory :problem do
    title { "テスト問題" }
    status { "未解決" }

    association :goal
  end
end
