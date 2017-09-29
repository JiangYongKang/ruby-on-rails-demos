# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(0..10).each do |i|
  User.create(name: "name-#{i + 1}", age: 18 + i)
end

(0..10).each do |i|
  Book.create(name: "name-#{i + 1}")
end
