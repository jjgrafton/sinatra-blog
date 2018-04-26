require 'faker'

User.create(first_name: Faker::Hipster.word, last_name: Faker::Hipster.word, email: "hipster@hipster.com", password: "123123", birthday: "1990-01-08" )

Post.create(title: Faker::Hipster.sentence(3), date: "2018-26-04", content: Faker::Hipster.paragraph)