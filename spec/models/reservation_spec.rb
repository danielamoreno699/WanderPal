require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'Alice') }

  it 'is valid with valid attributes' do
    reservation = user.reservations.new(city: 'New York', date: Date.today)
    expect(reservation).to be_valid
  end

  it 'is not valid without a city' do
    reservation = user.reservations.new(date: Date.today)
    expect(reservation).not_to be_valid
  end

  it 'is not valid without a date' do
    reservation = user.reservations.new(city: 'Paris')
    expect(reservation).not_to be_valid
  end

  it 'has many items through item_reservations' do
    reservation = user.reservations.create(city: 'London', date: Date.today)
    item1 = reservation.items.create(name: 'Item 1')
    item2 = reservation.items.create(name: 'Item 2')

    expect(reservation.items).to include(item1, item2)
  end

  it 'destroys associated item_reservations when deleted' do
    reservation = user.reservations.create(city: 'Tokyo', date: Date.today)
    reservation.items.create(name: 'Item 3')
    ItemReservation.count
    reservation.destroy
    expect(ItemReservation.count).to eq(0)
  end
end
