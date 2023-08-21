class Reservation < ApplicationRecord
  belongs_to :user
  has_many :item_reservations, dependent: :destroy
  has_many :items, through: :item_reservations

  validates :city, presence: true, length: { maximum: 50 }
  validates :date, presence: true
end
