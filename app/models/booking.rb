class Booking < ApplicationRecord
  has_many :users
  belongs_to :package
  has_many :messages
  validates :date, presence: true

  enum status: [ :pending, :accepted, :declined, :completed]
end
