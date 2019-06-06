class Listing < ApplicationRecord
  belongs_to :book
  belongs_to :user

  has_many :closed_listings
end
