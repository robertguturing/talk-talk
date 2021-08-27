# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = 50.times do |i|
  user = User.create(
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email
             )

  puts "Creating user with id #{user.id}"
end

470.times do |i|
  sender = User.find(User.pluck(:id).sample)
  recipient = User.find(User.pluck(:id).sample)
  next if sender.id == recipient.id
  message = Message.create(text: Faker::Company.bs, sender_id: sender.id, recipient_id: recipient.id)
  puts "Message #{message.id} created with text #{message.text}"
end
