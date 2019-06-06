class ClosedListingSerializer < ActiveModel::Serializer
  attributes :id, :listing, :purchaser, :exchange_item
end
