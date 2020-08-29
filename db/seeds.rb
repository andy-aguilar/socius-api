# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Club.destroy_all
Run.destroy_all


andy = User.create({first_name: 'Andy', last_name: 'Aguilar', email_address: 'aaguil3@gmail.com', password: '@Boliando86'})
kristin = User.create({first_name: 'Kristin', last_name: 'Schallhorn', email_address: 'kristin@kristin.com', password: "#Rapido318"})

10.times do 
    kristin.runs << Run.create({name: Faker::Coffee.blend_name, distance: rand(11), complete: [true, false].sample})
    andy.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), complete: [true, false].sample})
end

puts "HOLY SHIT IT WORKED!"