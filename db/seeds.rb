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
Friendship.destroy_all



andy = User.create({first_name: 'Andy', last_name: 'Aguilar', email_address: 'aaguil3@gmail.com', password: '@Boliando86'})
kristin = User.create({first_name: 'Kristin', last_name: 'Schallhorn', email_address: 'kristin@kristin.com', password: "andyiscool"})
val = User.create({first_name: 'Valerie', last_name: 'Aguilar', email_address: 'val@val.com', password: 'andyiscool'})
ali = User.create({first_name: 'Alexia', last_name: 'Aguilar', email_address: 'ali@ali.com', password: 'andyiscool'})
mom = User.create({first_name: 'Kattya', last_name: 'Aguilar', email_address: 'mom@mom.com', password: 'andyiscool'})
dad = User.create({first_name: 'Humberto', last_name: 'Aguilar', email_address: 'dad@dad.com', password: 'andyiscool'})

def day
    rand(27) + 1
end

def random_deg (max, min)
    rand * (max-min) + min
end

def minute
    array = [00, 15, 30, 45]
    return array.sample
end

def year 
    array = [2020, 2021]
    return array.sample
end

30.times do 
    kristin.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: kristin.id, latitude: random_deg(38.8119, 38.9955), longitude: random_deg(-76.9093, -77.1515), zoom: 12.80, date: DateTime.new(year,rand(1..12),day,rand(5..20),minute)})
    andy.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: andy.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(year,rand(1..12),day,rand(5..20),minute)})
    dad.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: dad.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(year,rand(1..12),day,rand(5..20),minute)})
    val.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: val.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(year,rand(1..12),day,rand(5..20),minute)})
    ali.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: ali.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(year,rand(1..12),day,rand(5..20),minute)})
    mom.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: mom.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(year,rand(1..12),day,rand(5..20),minute)})
end

puts "HOLY SHIT IT WORKED!"