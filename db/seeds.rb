# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# Create sample users
user1 = User.create(name: 'Adnan Ahmad')
user2 = User.create(name: 'Istehsan Ahmad')

# Create sample items
item1 = Item.create(name: 'Item 1', price: 19.99, description: 'A great item for your needs.', user: user1)
item2 = Item.create(name: 'Item 2', price: 29.99, description: 'Another high-quality item.', user: user2)

# Create sample reservations
reservation1 = Reservation.create(date: Date.today, city: 'City A', user: user1)
reservation2 = Reservation.create(date: Date.tomorrow, city: 'City B', user: user2)

# Associate items with reservations through item_reservations
ItemReservation.create(item: item1, reservation: reservation1)
ItemReservation.create(item: item2, reservation: reservation2)

puts 'Seed data has been created.'
