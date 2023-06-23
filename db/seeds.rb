require "open-uri"

Booking.destroy_all
Tent.destroy_all
User.destroy_all

puts "create user"

patrick = User.create!(first_name: "Patrick", email: "patrick.amazing@gmail.com", password: "patrick")
patrick_file = URI.open("https://images.pexels.com/photos/17013946/pexels-photo-17013946/free-photo-of-fashion-man-people-dark.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load")
patrick.photo.attach(io: patrick_file, filename: "patrick.png", content_type: "image/jpg")
patrick.save!
josephine = User.create!(first_name: "Josephine", email: "josephine.amazing@gmail.com", password: "josephine")
josephine_file = URI.open("https://images.pexels.com/photos/17045109/pexels-photo-17045109/free-photo-of-young-brunette-with-bangs-wearing-an-elegant-outfit.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load")
josephine.photo.attach(io: josephine_file, filename: "josephine.png", content_type: "image/jpg")
josephine.save!

puts "Finished user!"

puts "create tent"
tent1 = Tent.create!(name: "Lake House Tent", description: "Amazing view on the lake", address: "31 lake street", price: 150, user: josephine)
tent1_file = URI.open("https://images.pexels.com/photos/45241/tent-camp-night-star-45241.jpeg?auto=compress&cs=tinysrgb&w=800")
tent1.photo.attach(io: tent1_file, filename: "tent1.png", content_type: "image/jpg")
tent1.save!

tent2 = Tent.create!(name: "Ocean House Tent", description: "Great view on the ocean", address: "31 ocean street", price: 200, user: josephine )
tent2_file = URI.open("https://images.pexels.com/photos/1687845/pexels-photo-1687845.jpeg?auto=compress&cs=tinysrgb&w=800")
tent2.photo.attach(io: tent2_file, filename: "tent2.png", content_type: "image/jpg")
tent2.save!

tent3 = Tent.create!(name: "River House Tent", description: "Beautiful view on the river", address: "31 river street", price: 90, user: patrick)
tent3_file = URI.open("https://images.pexels.com/photos/803226/pexels-photo-803226.jpeg?auto=compress&cs=tinysrgb&w=800")
tent3.photo.attach(io: tent3_file, filename: "tent3.png", content_type: "image/jpg")
tent3.save!
puts "Finished tent!"

puts "create a booking"
Booking.create!(user: patrick, tent: tent1)
Booking.create!(user: patrick, tent: tent2)
Booking.create!(user: josephine, tent: tent3)
puts "finished booking seeds!"
