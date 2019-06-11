class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :authors, :genres 

  def genres  
    ActiveModel::SerializableResource.new(object.genres,  each_serializer: GenreSerializer)
  end

  def authors 
    ActiveModel::SerializableResource.new(object.authors,  each_serializer: AuthorSerializer)
  end

  
end
