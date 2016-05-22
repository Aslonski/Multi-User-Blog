User.destroy_all
Post.destroy_all

5.times do
  User.create!(
    user_name: Faker::StarWars.character,
    email:    Faker::Internet.email,
    password: "password"
    )
end

20.times do
  Post.create!(
    title:   Faker::StarWars.quote,
    content: Faker::Hipster.paragraph,
    author_id: rand(1..5)
    )
end