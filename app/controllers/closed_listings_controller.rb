class ClosedListingsController < ApplicationController


    def create_closed_listing
        user = get_current_user
        if user
            listing = Listing.find_by(id: params[:id])
            if listing.user == user 
                closed_listing  = ClosedListing.create(exchange_item: closed_listing_params)
                closed_listing.update(listing: listing, purchaser: user)
                listing.update(open_listing: false)
                render json: closed_listing 
            else 
                render json: {error: 'Invalid request.'}, status: 400
            end 

        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
    end 

    private 

    def closed_listing_params 
        params.require(:exchange_item)
    end 

end
