# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Garden.destroy_all
Booking.destroy_all
User.destroy_all



john = User.create(username:"Johndoe", email:"john@gmail.com", password:"mypassword1", bio:"I want to share my lovely garden!")
jane = User.create(username:"Janedoe", email:"jane@gmail.com", password:"mypassword1", bio:"I want to share my lovely garden!")
joe = User.create(username:"Joe", email:"joe@gmail.com", password:"mypassword1", bio:"I want to share my lovely garden!")
nick = User.create(username:"Nick", email:"nick@gmail.com", password:"mypassword1", bio:"I want to share my lovely garden!")
terri = User.create(username:"Terri", email:"terri@gmail.com", password:"mypassword1", bio:"I want to share my lovely garden!")
benoit = User.create(username:"Benoit", email:"benoit@gmail.com", password:"mypassword1", bio:"I want to share my lovely garden!")

johnsgarden = Garden.create(name:"Big garden", location:"London, SE10, UK", size:"40", description:"Lovely big garden", purpose:"Garden party", price_per_day:"10", user:john)
janesgarden = Garden.create(name:"Plot of land for growing veg", location:"London, SE8, UK", size:"10", description:"Square plot of land", purpose:"Growing vegetables", price_per_day:"5", user:jane)

joesgarden = Garden.create(name:"Fab little plot", location:"London, NW3, UK", size:"8", description:"Little plot for growing", purpose:"Growing flowers", price_per_day:"8", user:joe)
nicksgarden = Garden.create(name:"Lovely suntrap", location:"London, NW1, UK", size:"5", description:"Sunny - great for herbs", purpose:"Growing herbs", price_per_day:"20", user:nick)
terrisgarden = Garden.create(name:"Good for vegetables", location:"London, S5, UK", size:"10", description:"Good quality soil", purpose:"Growing vegetables", price_per_day:"10", user:terri)
benoitssgarden = Garden.create(name:"Nice space for dinner parties", location:" London, SE7, UK", size:"40", description:"Fab outdoor space", purpose:"Garden Party", price_per_day:"50", user:benoit)

janesreview = Review.create(rating:4, description:"gorgeous garden, we had a great time", user:jane, garden:johnsgarden)
johnsreview = Review.create(rating:5, description:"great plot, potatoes grew really well", user:john, garden:janesgarden)

