cate = ["World", "Politics", "Business", "Tech", "Science", "Sports", "Arts"]

cate.each do |n|
  Category.create!(name: n)
end

User.create!(
  name:  Faker::Name.name,
  birthday: Faker::Date.birthday(18, 65),
  address: Faker::Address.full_address,
  email: "admin@gmail.com",
  role: "admin",
  password: "password")

User.create!(
  name:  Faker::Name.name,
  birthday: Faker::Date.birthday(18, 65),
  address: Faker::Address.full_address,
  email: "author@gmail.com",
  role: "author",
  password: "password")

10.times do |n|
  User.create!(
    name:  Faker::Name.name,
    birthday: Faker::Date.birthday(18, 65),
    address: Faker::Address.full_address,
    email: "user0#{n+3}@gmail.com",
    role:["user", "author"].sample,
    password: "password")
end

100.times do |n|
  Post.create!(
    user_id: "2",
    title: Faker::Lorem.sentence,
    header: Faker::Lorem.sentence,
    active: true,
    content_new: Faker::Lorem.sentences(5),
    category_id: Category.pluck(:id).sample)
end

