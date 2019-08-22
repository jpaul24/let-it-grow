class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :gardens
  has_many :bookings, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: true

  mount_uploader :photo, PhotoUploader
end
