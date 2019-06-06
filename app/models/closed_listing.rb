class ClosedListing < ApplicationRecord
  belongs_to :listing
  belongs_to :purchaser, :class_name => 'User'
end
