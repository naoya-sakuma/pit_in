# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'シード',
  email: 'seed@test.com',
  password: 'seed@test.com',
  confirmed_at: Time.now
)

2.times do |n|
  user = User.find_by(name: 'シード')
  title = Faker::Job.title
  user.goals.create!(title: title)
end

2.times do |n|
  Goal.all.each do |goal|
    title = Faker::Job.title
    goal.problems.create!(title: title)
  end
end

2.times do |n|
  Problem.all.each do |problem|
    title = Faker::Job.title
    problem.solutions.create!(title: title)
  end
end

2.times do |n|
  Solution.all.each do |solution|
    title = Faker::Job.title
    solution.tasks.create!(title: title)
  end
end


2.times do |n|
  Task.all.each do |task|
    title = Faker::Job.title
    task.steps.create!(title: title)
  end
end
