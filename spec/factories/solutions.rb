FactoryBot.define do
  factory :solution do
    title { "取組中のテスト解決案" }
    status { "取組中" }

    association :problem
  end

  factory :second_solution, class: Solution do
    title { "保留中のテスト解決案" }
    status { "保留中" }

    association :problem
  end
end
