# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"


Booking.destroy_all
Tent.destroy_all
User.destroy_all

cloudinary_tent = URI.open("https://source.unsplash.com/random/?tent")
cloudinary_person = URI.open("https://source.unsplash.com/random/?person")

puts "create user"
patrick = User.create!(first_name: "Patrick", email: "patrick.amazing@gmail.com", password: "patrick", description: "blablabla", last_name: "dupont")
patrick.photo.attach(io: cloudinary_person, filename: "nes.png", content_type: "image/png")
patrick.save!
puts "Finished user!"

puts "create tent"
tent1 = Tent.create!(name: "lakehouse", description: "Amazing view on the lake", address: "31 lake street", price: 150, user: patrick)
tent1.photo.attach(io: cloudinary_tent, filename: "nes.png", content_type: "image/png")

tent1.save

puts "create tent"
tent1 = Tent.create!(name: "lakehouse", description: "Amazing view on the lake", address: "31 lake street", price: 150, user: patrick, photo_url: "https://source.unsplash.com/random/?tent")
tent2 = Tent.create!(name: "oceanhouse", description: "Amazing view on the ocean", address: "31 ocean street", price: 200, user: patrick, photo_url: "https://source.unsplash.com/random/?tent")
tent3 = Tent.create!(name: "riverhouse", description: "Amazing view on the river", address: "31 river street", price: 90, user: patrick, photo_url: "https://source.unsplash.com/random/?tent")

puts "Finished tent!"

puts "create a booking"
booking1 = Booking.create!(user: patrick, tent: tent1)
booking2 = Booking.create!(user: patrick, tent: tent2)
booking3 = Booking.create!(user: patrick, tent: tent3)
puts "finished booking seeds!"
