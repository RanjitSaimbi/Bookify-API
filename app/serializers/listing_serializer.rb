class ListingSerializer < ActiveModel::Serializer
  attributes :id, :book, :user, :location, :image_url, :category, :condition, :open_listing, :created_at, :updated_at

  has_many :closed_listings

  def book
      ActiveModel::SerializableResource.new(object.book,  each_serializer: BookSerializer)
  end

  def user  
    ActiveModel::SerializableResource.new(object.user,  each_serializer: UserSerializer)
  end
end 

