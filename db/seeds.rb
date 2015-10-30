require 'faker'
10.times do
  User.create!(username: Faker::Internet.user_name, password: "password"  )
  Survey.create!(title: Faker::Book.title, description: Faker::Lorem.sentence, user_id: rand(1..10) )
end


