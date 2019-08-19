class Booking < ApplicationRecord
  belongs_to :garden
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
end
