FactoryBot.define do
  factory :task do
    title { "取組中のテストタスク" }
    status { "取組中" }

    association :solution
  end

  factory :second_task, class: Task do
    title { "保留中のテストタスク" }
    status { "保留中" }

    association :solution
  end
end
