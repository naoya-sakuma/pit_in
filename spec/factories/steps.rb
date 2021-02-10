FactoryBot.define do
  factory :step do
    title { "取組中のテストステップ" }
    status { "取組中" }

    association :task
  end

  factory :second_step, class: Step do
    title { "保留中のテストステップ" }
    status { "保留中" }

    association :task
  end
end
