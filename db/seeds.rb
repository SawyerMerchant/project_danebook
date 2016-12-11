# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == "development"
  puts "Deleting Posts"
  Post.delete_all
  puts "Deleting Profiles"
  Profile.delete_all
  puts "Deleting Users"
  User.delete_all
end

NUM = 5

puts "Creating Users"
users = []
NUM.times do |n|
  users << User.create(email:       "user#{n}@gmail.com",
                      password:     "foobar123",)
end

puts "Creating Profiles"
users.each do |u|
  u.profile = Profile.create(
                      first_name:   Faker::Name.first_name,
                      last_name:    Faker::Name.last_name,
                      gender:       Faker::Lorem.word,
                      birthday:     Faker::Time.between(15.years.ago, 125.years.ago),
                      telephone:    Faker::PhoneNumber.phone_number,
                      college:      Faker::University.name,
                      hometown:     Faker::Address.city,
                      currentlylives: Faker::Address.city,
                      words:        Faker::Hipster.paragraph,
                      about:        Faker::Hipster.paragraph(2))
end

puts "Creating Posts"
users.each do |u|
  NUM.times do |n|
    u.posts.create(body: Faker::Hipster.sentence(2) )
  end
end
