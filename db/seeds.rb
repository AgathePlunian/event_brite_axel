# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

100.times do
	prenom = Faker::Name.first_name
	nom = Faker::Name.last_name
	User.create(email: "#{prenom}.#{nom}@yopmail.com", first_name: prenom, last_name: nom, description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote)
end

20.times do
	event = Event.create(admin: User.all[rand(0..99)], start_date: Faker::Date.forward(days: 10), duration: 5 * rand(2..24), title: Faker::Book.title, description: Faker::Hipster.paragraph, price: rand(1..50), location: Faker::Address.street_address)
end

200.times do
	guest = User.all[rand(0..99)]
 	event = Event.all[rand(0..19)]
	Attendance.create(user: guest, event: event)
end
