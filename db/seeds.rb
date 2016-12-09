# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == "development"
  puts "Deleting Users"
  User.delete_all
end

NUM = 1
puts "Creating Users"
NUM.times do |n|
  User.create(email: "user#{n}@gmail.com", password: "foobar123" )
end
