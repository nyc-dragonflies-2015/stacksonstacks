tf = [true, false]

100.times do
  User.create(username: Faker::Name.name, password: "123", reputation: rand(1000))
end


200.times do
  Answer.create(body: Faker::Lorem.paragraph, best: tf[rand(2)], user_id: rand(100)+1, question_id: rand(75)+1)
end

75.times do
  Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: rand(100)+1)
end


q_and_a_comments = [
  Answer.all[rand(200)].comments.create(body: Faker::Lorem.paragraph, user_id: rand(100)+1),
  Question.all[rand(75)].comments.create(body: Faker::Lorem.paragraph, user_id: rand(100)+1)
]
300.times do
  q_and_a_comments[rand(2)]
end

35.times do
  User.all[rand(100)].favorited_questions << Question.all[rand(75)]
end

300.times do
  Tag.create(name: Faker::Hacker.adjective)
end

Question.all.each do |q|
  q.tags << Tag.all[rand(300)]
end
