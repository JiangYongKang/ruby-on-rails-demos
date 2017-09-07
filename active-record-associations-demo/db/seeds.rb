# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..3).each do |i|
  Dept.create(name: "dept_#{i}")
end

(1..10).each do |i|
  Account.create(user_name: "user_name_#{i}", password: "password_#{i}")
end

(1..10).each do |i|
  User.create(name: "name_#{i}", email: "email_#{i}", telphone: "telphone_#{i}", dept_id: i % 3 + 1, account_id: i)
end

(1..10).each do |i|
  Role.create(name: "name_#{i}")
end

(1..10).each do |i|
  AccountsRole.create(account_id: i % 3 + 1, role_id: i)
end
