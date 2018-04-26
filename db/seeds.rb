require 'faker'

User.create(first_name: Faker::Hipster.word, last_name: Faker::Hipster.word, email: "hipster@hipster.com", password: "123123", birthday: 1990-4-8)

Post.create(title: Faker::Hipster.sentence(3), date: 2018-26-4, content: Faker::Hipster.paragraph)