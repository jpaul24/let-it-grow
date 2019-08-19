class Garden < ApplicationRecord
  PURPOSE = ["Garden party", "Growing vegetables", "Growing flowers", "Growing herbs"]
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price_per_day, presence: true
  validates :purpose, inclusion: { in: PURPOSE }

  has_many :reviews
  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
