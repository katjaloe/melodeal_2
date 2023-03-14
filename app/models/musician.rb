class Musician < ApplicationRecord
  belongs_to :user
  has_many :packages
  has_many :reviews
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :location, presence: true
  validates :type_of_musician, presence: true
  validates :nickname, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
