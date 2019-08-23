class Review < ApplicationRecord
  RATING = [0, 1, 2, 3, 4, 5]
  belongs_to :user
  belongs_to :garden

  validates :description, presence: true, length: { minimum: 20 }
  validates :rating, presence: true
  validates :rating, inclusion: { in: RATING }


end
