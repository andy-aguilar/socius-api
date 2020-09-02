# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserRun.destroy_all
User.destroy_all
Club.destroy_all
Run.destroy_all


andy = User.create({first_name: 'Andy', last_name: 'Aguilar', email_address: 'aaguil3@gmail.com', password: '@Boliando86'})
kristin = User.create({first_name: 'Kristin', last_name: 'Schallhorn', email_address: 'kristin@kristin.com', password: "#Rapido318"})

def day
    rand(27) + 3
end

3.times do 

    kristin.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), complete: [true, false].sample, user_owner_id: kristin.id, latitude: 38.8892, longitude: -77.0489, zoom: 14.65, date: DateTime.new(2020,9,day,6,30)})
    andy.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), complete: [true, false].sample, user_owner_id: andy.id, longitude: -77.00792940206053, latitude: 38.889717139049566, zoom: 12.80, date: DateTime.new(2020,9,day,6,30)})
end

puts "HOLY SHIT IT WORKED!"