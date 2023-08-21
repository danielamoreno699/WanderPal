require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "John Doe")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new
    expect(user).not_to be_valid
  end

  it "is not valid if the name is too long" do
    user = User.new(name: "a" * 51) # Create a name with more than 50 characters
    expect(user).not_to be_valid
  end

  it "destroys associated items when deleted" do
    user = User.create(name: "Alice")
    item = user.items.create(name: "Item 1")
    user.destroy
    expect(Item.count).to eq(0)
  end
  
  it "destroys associated reservations when deleted" do
    user = User.create(name: "Bob")
    reservation = user.reservations.create(date: Date.today)
    user.destroy
    expect(user.reservations.count).to eq(0)
  end
end
