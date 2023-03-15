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
  validates :description, presence: true

  def average_rating
    ratings = reviews.map do |review|
      review.rating / 1.0
    end
    return 0 if ratings.length.zero?

    ratings.sum / ratings.length
  end




end
