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
esther = User.create({first_name: 'Esther', last_name: 'Kang', email_address: 'esther@esther.com', password: 'esther'})

dave = User.create({first_name: 'Dave', last_name: 'Frame', email_address: 'dave@dave.com', password: 'dave'})
diego = User.create({first_name: 'Diego', last_name: 'Zegarra', email_address: 'diego@diego.com', password: 'diego'})
zara = User.create({first_name: 'Zara', last_name: 'Ahmadi', email_address: 'zara@zara.com', password: 'zara'})
david = User.create({first_name: 'David', last_name: 'Chung', email_address: 'david@david.com', password: 'david'})
issa = User.create({first_name: 'Issa', last_name: 'Sangare', email_address: 'issa@issa.com', password: 'issa'})
mikec = User.create({first_name: 'Michael', last_name: 'Causey', email_address: 'mikec@mikec.com', password: 'mikec'})
steve = User.create({first_name: 'Steve', last_name: 'Pesce', email_address: 'steve@steve.com', password: 'steve'})
jr = User.create({first_name: 'Johnnathan', last_name: 'Baxter', email_address: 'jr@jr.com', password: 'jr'})
tien = User.create({first_name: 'Tien', last_name: 'Phan', email_address: 'tien@tien.com', password: 'tien'})
shawn = User.create({first_name: 'Shawn', last_name: 'Alexander', email_address: 'shawn@shawn.com', password: 'shawn'})
luis = User.create({first_name: 'Luis', last_name: 'Fernandez', email_address: 'luis@luis.com', password: 'luis'})
marcos = User.create({first_name: 'Marcos', last_name: 'Velasco', email_address: 'marcos@marcos.com', password: 'marcos'})
mikej = User.create({first_name: 'Mike', last_name: 'Jester', email_address: 'mikej@mikej.com', password: 'mikej'})
danny = User.create({first_name: 'Danny', last_name: 'Coop', email_address: 'danny@danny.com', password: 'danny'})




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
    kristin.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: kristin.id, latitude: random_deg(38.8119, 38.9955), longitude: random_deg(-76.9093, -77.1515), zoom: 12.80, date: DateTime.new(2020,rand(6..12),day,rand(5..20),minute)})
    andy.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: andy.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(2020,rand(6..12),day,rand(5..20),minute)})
    dad.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: dad.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(2020,rand(6..12),day,rand(5..20),minute)})
    val.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: val.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(2020,rand(6..12),day,rand(5..20),minute)})
    ali.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: ali.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(2020,rand(6..12),day,rand(5..20),minute)})
    mom.runs << Run.create({name: Faker::Quote.most_interesting_man_in_the_world, distance: rand(11), user_owner_id: mom.id, longitude: random_deg(-76.9093, -77.1515), latitude: random_deg(38.8119, 38.9955), zoom: 12.80, date: DateTime.new(2020,rand(6..12),day,rand(5..20),minute)})
end

puts "HOLY SHIT IT WORKED!"