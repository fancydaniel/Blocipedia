require 'faker'

admin_user = User.create!(
  name: 'Sue Example',
  email: 'sue@example.com', 
  role: 'admin', 
  password: 'hamburger', 
  password_confirmation: 'hamburger')
admin_user.save!

standard_user = User.create!(
  name: 'Joe Example', 
  email: 'joe@example.com', 
  role: 'standard',
  password: 'hamburger', 
  password_confirmation: 'hamburger')
standard_user.save!

premium_user = User.create!(
  name: 'Sam Example', 
  email: 'sam@example.com',
  role: 'premium',
  password: 'hamburger', 
  password_confirmation: 'hamburger')
premium_user.save!

users = User.all

# Create Public Wikis
12.times do |n|
  user = users.sample
  Wiki.create!(
    title:    "Public-#{user.name}-#{n}",
    body:     Faker::Lorem.paragraph,
    user:     users.sample
  )
end

# Create Private Wikis for premium user
4.times do |n|
  Wiki.create!(
    title:    "Private-#{premium_user.name}-#{n}",
    body:     Faker::Lorem.paragraph,
    user:     premium_user,
    private:  true 
  )
end

# Create Private Wikis for admin user
4.times do |n|
  Wiki.create!(
    title:    "Private-#{admin_user.name}-#{n}",
    body:     Faker::Lorem.paragraph,
    user:     admin_user,
    private:  true 
  )
end

puts "Seeds finished"
puts "#{User.count} Users created"
puts "#{Wiki.count} Wikis created"
