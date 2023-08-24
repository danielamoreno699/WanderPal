puts 'Clearing existing data...'
ItemReservation.destroy_all
Reservation.destroy_all
Item.destroy_all
User.destroy_all

# Create users
puts 'Creating users...'
user1 = User.create(name: 'Adnan Ahmad')
user2 = User.create(name: 'Istehsan Ahmad')

# Create items
puts 'Creating items...'
items_data = [
  {
    name: 'Historic City Tour',
    image: 'https://cdn.tourcms.com/a/11676/2846/1/default.jpg',
    price: 19.99,
    description: 'Explore the rich history and cultural heritage of our city on this informative tour.',
    user: user1
  },
  {
    name: 'Nature Adventure Hike',
    image: 'https://www.naturethreads.club/wp-content/uploads/2019/09/5-Ways-To-Connect-With-Nature-Through-Adventure-Hiking-533x400.jpg',
    price: 29.99,
    description: 'Embark on an exciting hiking adventure through pristine wilderness and breathtaking landscapes.',
    user: user2
  },
  {
    name: 'Ghost and Mystery Tour',
    image:'https://www.freetour.com/images/tours/28370/ghost-and-mistery-tour-of-rome-05.jpg',
    price: 29.99,
    description: 'Uncover the hidden secrets and eerie tales of our haunted history.',
    user: user2
  },
  {
    name: 'Wildlife Safari',
    image: 'https://worldexpeditions.com/croppedImages/Africa/Namibia/Chobe-National-Park-Namibia-Africa-306672-950px-16x7.jpg',
    price: 54.99,
    description: 'Embark on a thrilling safari to spot majestic wildlife in their natural habitat.',
    user: user1
  },
  {
    name: 'Winery and Vineyard Tour',
    image:'https://cdn.getyourguide.com/img/tour/6230a2e4060e1.jpeg/97.jpg',
    price: 34.99,
    description: 'Indulge in a wine-tasting experience as you tour local wineries and lush vineyards.',
    user: user2
  },
  {
    name: 'Adventure Zip-Lining',
    image: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/71/f1/bd.jpg',
    price: 44.99,
    description: 'Soar through the treetops on an exhilarating zip-lining adventure.',
    user: user1
  },
  {
    name: 'Historical Landmarks Tour',
    image: 'https://cdn-bmalj.nitrocdn.com/uirOOtSrYrqqUksKHkiSCjZGZlPeXsmk/assets/images/optimized/rev-c3635d7/images/historical-sites-colosseum.jpg',
    price: 26.99,
    description: 'Visit iconic landmarks that tell the stories of our past and shape our future.',
    user: user2
  },
]

items = Item.create!(items_data)

# Create reservations
puts 'Creating reservations...'
reservation1 = Reservation.create(date: Date.today, city: 'City A', user: user1)
reservation2 = Reservation.create(date: Date.tomorrow, city: 'City B', user: user2)

# Associate items with reservations through item_reservations
puts 'Associating items with reservations...'
ItemReservation.create(item: items[0], reservation: reservation1)
ItemReservation.create(item: items[1], reservation: reservation2)

puts 'Seed data has been created.'

