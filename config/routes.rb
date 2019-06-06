Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


   # User routes
   post '/signin', to: 'users#signin'
   get '/validate', to: 'users#validate'
 
   # Listing routes
   get '/listings', to: 'listings#get_listings'

end
