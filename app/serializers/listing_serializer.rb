class ListingSerializer < ActiveModel::Serializer
  attributes :id, :book, :user, :location, :image_url, :category, :condition, :open_listing, :created_at, :updated_at
end
