class Book < ApplicationRecord
  belongs_to :user
  has_many :genres
  has_many :authors
  has_many :listings
end
