class Review < ApplicationRecord
  validates :author, presence: true,
            length: { minimum: 2 }
  validates :email, presence: true
  validates :rating, presence: true

  belongs_to :restaurant
  belongs_to :user
end
