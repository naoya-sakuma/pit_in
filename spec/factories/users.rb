FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@test.com' }
    password { 'test@test.com' }
    nickname { 'てすとゆーざー' }
    uid { "1" }
    provider { "1" }
  end

  factory :second_user, class: User do
    name { 'テストユーザー2' }
    email { 'test2@test.com' }
    password { 'test2@test.com' }
    nickname { 'てすとゆーざー2' }
    uid { "2" }
    provider { "2" }
  end
end
