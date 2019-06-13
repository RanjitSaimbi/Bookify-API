Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


   # User routes
   post '/signup', to: 'users#signup'
   post '/signin', to: 'users#signin'
   get '/validate', to: 'users#validate'
   post '/sendmessage', to: 'users#send_message'
   delete '/deletemessage', to: 'users#delete_message'
   get'/getbookmessages/:book_id', to: 'users#get_book_messages'
 
   # Listing routes
   get '/listings', to: 'listings#get_listings'
   get '/mylistings', to: 'listings#my_listings'
   post '/createlisting', to: 'listings#create_listing'
   post '/editlisting', to: 'listings#edit_listing'
   delete '/deletelisting', to: 'listings#delete_listing'

  #  ClosedListing route(s)

  post '/createclosedlisting', to: 'closed_listings#create_closed_listing'

end
