require "open-uri"

Booking.destroy_all
Tent.destroy_all
User.destroy_all

puts "create user"

patrick = User.create!(first_name: "Patrick", email: "patrick.amazing@gmail.com", password: "patrick")
patrick_file = URI.open("https://res.cloudinary.com/dnow6fswp/image/upload/v1687437515/pexels-streetwindy-3628700_elpyh9.jpg")
patrick.photo.attach(io: patrick_file, filename: "patrick.png", content_type: "image/jpg")
patrick.save!
josephine = User.create!(first_name: "Josephine", email: "josephine.amazing@gmail.com", password: "josephine")
josephine_file = URI.open("https://res.cloudinary.com/dnow6fswp/image/upload/v1687437519/pexels-arianna-jade%CC%81-4006576_rfe3az.jpg")
josephine.photo.attach(io: josephine_file, filename: "josephine.png", content_type: "image/jpg")
josephine.save!

puts "Finished user!"

puts "create tent"
tent1 = Tent.create!(name: "Lake House Tent", description: "Amazing view on the lake", address: "31 lake street", price: 150, user: josephine)
tent1_file = URI.open("https://res.cloudinary.com/dnow6fswp/image/upload/v1687438448/pexels-teemu-r-1840421_wvaqrn.jpg")
tent1.photo.attach(io: tent1_file, filename: "tent1.png", content_type: "image/jpg")
tent1.save!

tent2 = Tent.create!(name: "Ocean House Tent", description: "Great view on the ocean", address: "31 ocean street", price: 200, user: josephine )
tent2_file = URI.open("https://res.cloudinary.com/dnow6fswp/image/upload/v1687438324/pexels-quang-nguyen-vinh-2582818_alo3um.jpg")
tent2.photo.attach(io: tent2_file, filename: "tent2.png", content_type: "image/jpg")
tent2.save!

tent3 = Tent.create!(name: "River House Tent", description: "Beautiful view on the river", address: "31 river street", price: 90, user: patrick)
tent3_file = URI.open("https://res.cloudinary.com/dnow6fswp/image/upload/v1687438327/pexels-pixabay-45241_zlsn9t.jpg")
tent3.photo.attach(io: tent3_file, filename: "tent3.png", content_type: "image/jpg")
tent3.save!
puts "Finished tent!"

puts "create a booking"
Booking.create!(user: patrick, tent: tent1)
Booking.create!(user: patrick, tent: tent2)
Booking.create!(user: josephine, tent: tent3)
puts "finished booking seeds!"
