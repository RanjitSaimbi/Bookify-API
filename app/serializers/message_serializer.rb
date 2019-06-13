class MessageSerializer < ActiveModel::Serializer
  attributes :id, :book, :sender, :recipient, :read, :body
  
end
