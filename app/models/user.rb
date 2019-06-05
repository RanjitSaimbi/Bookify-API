class User < ApplicationRecord
    has_secure_password

    has_many :listings
    has_many :books 
    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
end
