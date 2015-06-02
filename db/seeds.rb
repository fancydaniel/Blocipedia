require 'faker'

user1 = User.create!(
  name: 'Sue Example',
  email: 'sue@example.com', 
  role: 'admin', 
  password: 'hamburger', 
  password_confirmation: 'hamburger')
user1.save!

user2 = User.create!(
  name: 'Joe Example', 
  email: 'joe@example.com', 
  role: 'standard',
  password: 'hamburger', 
  password_confirmation: 'hamburger')
user2.save!

user3 = User.create!(
  name: 'Sam Example', 
  email: 'sam@example.com',
  role: 'premium',
  password: 'hamburger', 
  password_confirmation: 'hamburger')
user3.save!

# 3.times do
#     user = User.new(
#                name:     Faker::Name.name,
#                email:    Faker::Internet.email,
#                password: 'hamburger'   
#                )
# user.save!
# end
users = User.all

# Create Wikis
12.times do
  Wiki.create!(
    title:    Faker::Lorem.sentence,
    body:     Faker::Lorem.paragraph,
    user:     users.sample
  )
end


puts "Seeds finished"
puts "#{User.count} Users created"
puts "#{Wiki.count} Wikis created"
