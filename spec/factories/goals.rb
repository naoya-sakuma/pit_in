FactoryBot.define do
  factory :goal do
    title { 'テスト1' }
    status { '取組中' }
    share { '公開' }
    association :user
  end

  factory :second_goal, class: Goal do
    title { 'テスト2' }
    status { '保留中' }
    share { '非公開' }
    association :user
  end

  factory :third_goal, class: Goal do
    title { 'テスト3' }
    status { '取組中' }
    share { '非公開' }
    association :user
  end
end
