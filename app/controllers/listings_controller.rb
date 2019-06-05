class ListingsController < ApplicationController

    def get_listings
        render json: Listing.all 
    end 

end
