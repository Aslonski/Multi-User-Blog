User.destroy_all
Post.destroy_all
Tag.destroy_all
Tagging.destroy_all

2.times do
  User.create!(
  user_name: Faker::StarWars.character,
  email:    Faker::Internet.email,
  password: "password"
  )
end

8.times do
  Post.create!(
  title:   Faker::StarWars.quote,
  content: Faker::Hipster.paragraph,
  author_id: rand(1..2)
  )
end

15.times do
  Tag.create!(
  name: Faker::Hipster.word
  )
end

30.times do
  Tagging.create!(
  post_id: rand(1..8),
  tag_id: rand(1..15)
  )
end