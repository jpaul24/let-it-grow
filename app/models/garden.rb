class Garden < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_location,
      against: [:location],
      using: {
        tsearch: { prefix: true }
      }

  PURPOSE = ["Garden party", "Growing vegetables", "Growing flowers", "Growing herbs"]

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price_per_day, presence: true
  validates :purpose, inclusion: { in: PURPOSE }

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader
end
