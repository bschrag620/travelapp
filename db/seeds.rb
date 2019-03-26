# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Dolly Adams", email: "dolly@adams.com", password: "password")
User.create(name: "Barnes Noble", email: "barnes@noble.com", password: "password")
User.create(name: "Ronald Rots", email: "ronald@rots.com", password: "password")
User.create(name: "Malcolm Rich", email: "malcolm@rich.com", password: "password")


thailand = Destination.create(country: "Thailand", state: "Kho Tao")
vietnam = Destination.create(country: "Vietnam", state: "Ho Chi Min")
mexico = Destination.create(country: "Mexico", state: "Guadalajara")
jamica = Destination.create(country: "Jamaica", state: "Negril")

#Activity.create(country: "Thailand", state: "Kho Tao")
#Activity.create(country: "Vietnam", state: "Ho Chi Min")
#Activity.create(country: "Mexico", state: "Guadalajara")
#Activity.create(country: "Jamaica", state: "Negril")



trip1 = Trip.create(:description => "to thailand", :user_id => 1, :budget => 100)
thailand.trips << trip1
trip1.save
trip2 = Trip.create(:description => "to thailand", :user_id => 2, :budget => 300)
thailand.trips << trip2
trip2.save
trip3 = Trip.create(:description => "to mexico", :user_id => 1, :budget => 500)
mexico.trips << trip3
trip3.save