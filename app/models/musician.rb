class Musician < ApplicationRecord
  belongs_to :user
  has_many :packages
  has_many :reviews
  has_one_attached :photo

  validates :nickname, presence: true
  validates :location, presence: true
  # validates :type_of_event, presence: true
  validates :type_of_musician, presence: true
end
