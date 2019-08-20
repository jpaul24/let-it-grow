# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all


john = User.new(username:"Johndoe", email:"john@gmail.com", password:"mypassword1")
jane = User.new(username:"Janedoe", email:"jane@gmail.com", password:"mypassword1")
john.save
jane.save

johnsgarden = Garden.new(name:"Big garden in SE10", location:"SE10", size:"40", description:"Lovely big garden", purpose:"Garden party", price_per_day:"10", user:john)
janesgarden = Garden.new(name:"Plot of land for growing veg", location:"NW1", size:"10", description:"Square plot of land", purpose:"Growing vegetables", price_per_day:"5", user:jane)
johnsgarden.save
janesgarden.save

janesreview = Review.new(rating:4, description:"gorgeous garden, we had a great time", user:jane, garden:johnsgarden)
johnsreview = Review.new(rating:5, description:"great plot, potatoes grew really well", user:john, garden:janesgarden)
janesreview.save
johnsreview.save

johnsbooking = Booking.new( user_id:2, garden_id:1, start_date: DateTime.new(2019,01,01), end_date: DateTime.new(2020,01,01))
johnsbooking.save
