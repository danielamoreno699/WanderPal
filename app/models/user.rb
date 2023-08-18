class User < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
