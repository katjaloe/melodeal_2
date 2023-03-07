class Package < ApplicationRecord
  belongs_to :musician
  has_many :booking
end
