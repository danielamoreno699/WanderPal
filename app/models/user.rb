class User < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :reservations, dependent: :destroy

  valid
end
