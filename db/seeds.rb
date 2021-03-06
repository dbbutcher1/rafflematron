# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new
admin.email = "admin@rafflematron.com"
admin.password = "password"
admin.password_confirmation = "password"
admin.add_role(:admin)
admin.save


raffle = Raffle.new
raffle.name = "Awesome Raffle"
raffle.uri = "awesome-raffle"
raffle.num_prizes = "2"
raffle.num_entries = "0"
raffle.raffle_owner = admin.email
raffle.has_winner = false
raffle.save

2.times do
prize = Prize.new
prize.prize_name = (0...8).map{65.+(rand(26)).chr}.join
prize.raffle_id = raffle.id
prize.save
end

50.times do
entry = Entry.new
entry.name = "David"
entry.email = (0...8).map{65.+(rand(26)).chr}.join + "@email.com"
entry.email = "dbbutcher1@gmail.com"
entry.raffle_id = raffle.id
entry.confirmed = true
entry.save
end

entry = Entry.new
entry.name = "David"
entry.email = (0...8).map{65.+(rand(26)).chr}.join + "@email.com"
entry.email = "dbbutcher2@gmail.com"
entry.raffle_id = raffle.id
entry.confirmed = true
entry.save
