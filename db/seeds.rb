require 'faker'

10.times do 
  Wiki.create!(
    title: Faker::Lorem.sentence, 
    body: Faker::Lorem.paragraph 
)
end

wikis = Wiki.all

#Create an admin user
admin = User.new(
  name: 'Admin User',
  email: 'admin_user@example.com', 
  password: 'helloworld', 
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

#Create a premium user
premium = User.new(
  name: 'Premium User',
  email: 'premium_user@example.com',
  password: 'helloworld',
  role: 'premium'
  )
premium.skip_confirmation!
premium.save!

#Create a standara(free) user
standard = User.new(
  name: 'standard User',
  email: 'standard_user@example.com',
  password: 'helloworld',
  role: 'standard'
  )

standard.skip_confirmation!
standard.save!

User.find_or_initialize_by(
  email: 'email').tap do |u|
  u.password = 'password'
end.save!

puts "Seeds finished"
puts "#{Wiki.count} wikis created"