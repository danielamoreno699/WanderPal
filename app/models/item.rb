class Item < ApplicationRecord
  belongs_to :user
  has_many :item_reservations, dependent: :destroy
  has_many :reservations, through: :item_reservations

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, length: { maximum: 50 } 
  validates :description, presence: true, length: { maximum: 500 }  
  validates :price, presence: true, numericality: { greater_than: 0 } 
end
