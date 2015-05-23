# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(name: 'Sue Example',
                    email: 'sue@example.com', 
                    role: 'standard', 
                    password: 'hamburger', 
                    password_confirmation: 'hamburger')
user2 = User.create!(name: 'Joe Example', 
                    email: 'joe@example.com', 
                    role: 'admin',
                    password: 'hamburger', 
                    password_confirmation: 'hamburger')

user3 = User.create!(name: 'Sam Example', 
                    email: 'sam@example.com',
                    role: 'premium',
                    password: 'hamburger', 
                    password_confirmation: 'hamburger')

puts "Seeds finished"