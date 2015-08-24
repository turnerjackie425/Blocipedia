require 'faker'

10.times do 
  Wiki.create!(
    title: Faker::Lorem.sentence, 
    body: Faker::Lorem.paragraph 
)
end

wikis = Wiki.all

puts "Seeds finished"
puts "#{Wiki.count} wikis created"