FactoryBot.define do
  factory :task do
    title { "MyString" }
    status { "MyString" }
    user { nil }
    solution { nil }
  end
end
