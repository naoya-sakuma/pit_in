FactoryBot.define do
  factory :goal do
    title { '取組中のテスト目標' }
    status { '取組中' }
    association :user
  end

  factory :second_goal, class: Goal do
    title { '保留中のテスト目標' }
    status { '保留中' }
    association :user
  end
end
