# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
Tent.destroy_all
User.destroy_all

puts "create user"
patrick = User.create!(first_name: "Patrick", email: "patrick.amazing@gmail.com", password: "patrick", profilepic: "https://source.unsplash.com/random/?person")
puts "Finished user!"

puts "create tent"
tent1 = Tent.create!(name: "lakehouse", description: "Amazing view on the lake", address: "31 lake street", price: 150, user: patrick, photo_url: "https://source.unsplash.com/random/?tent")
tent2 = Tent.create!(name: "oceanhouse", description: "Amazing view on the ocean", address: "31 ocean street", price: 200, user: patrick, photo_url: "https://source.unsplash.com/random/?tent")
tent3 = Tent.create!(name: "riverhouse", description: "Amazing view on the river", address: "31 river street", price: 90, user: patrick, photo_url: "https://source.unsplash.com/random/?tent")
puts "Finished tent!"
