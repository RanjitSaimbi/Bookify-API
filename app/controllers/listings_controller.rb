class ListingsController < ApplicationController

    def get_listings
        render json: Listing.all 
    end 

    def my_listings
        user = get_current_user
        if user
          render json: user.listings
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
    end 

    def create_listing 
        user = get_current_user
        if user
        # create book
          book = Book.create(title: book_params, user: user)
        # create associated genres
          genre_params.each do |genre| 
            book.genres.build(genre: genre) 
          end 
        # create associated authors
          author_params.each do |author| 
            book.authors.build(author: author) 
          end 
        # save book
          book.save 
        # create listing and associate with user and book
          listing = Listing.create(listing_params)
          listing.update(user: user, book: book)
          render json: listing 
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
    end 

    def edit_listing
        user = get_current_user
        if user
          listing = Listing.find_by(id: params[:id])
            if listing.user == user 
                listing.update(listing_params)
                render json: listing
            else 
                render json: {error: 'Invalid request.'}, status: 400
            end 

        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
    end 

    def delete_listing 
        user = get_current_user
        listing = Listing.find_by(id: params[:id])
        if user && listing.user == user  
            if listing.user == user 
                listing.destroy
                render json: {ok: 'Listing successfully deleted.'}, status: 200
            else 
                render json: {error: 'Invalid request.'}, status: 400
            end 

        else
          render json: {error: 'Invalid request.'}, status: 400
        end 
    end 

    private 

    def genre_params
        params.require(:genre)
    end 

    def author_params
        params.require(:author)
    end 

    def book_params 
        params.require(:title) 
    end 

    def listing_params
        params.require(:listing).permit(:book, :user, :location, :image_url, :category, :condition, :open_listing)
    end 

end
