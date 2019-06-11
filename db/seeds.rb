
require 'faker'

r = User.create(email: "ranjit.saimbi@gmail.com", username: "Ranjit", password: "12345")
m = User.create(email: "myrto.konstantinidi@gmail.com", username: "Myrto", password: "12345")

10.times do 
    br = Book.create(
    title: Faker::Book.title,
    user: r,
    genre: Faker::Book.genre,
    author: Faker::Book.author
    )

    Listing.create(
        book: br,
        user: r,
        location: Faker::Nation.capital_city,
        image_url: ["https://cdn.waterstones.com/bookjackets/large/9781/7853/9781785301544.jpg", "http://prodimage.images-bn.com/pimages/9780441005482_p0_v2_s1200x630.jpg", "https://www.booktopia.com.au/http_coversbooktopiacomau/big/9781444910582/0000/the-famous-five-collection-collection-1.jpg", "https://d3ddkgxe55ca6c.cloudfront.net/assets/t1519638244/a/1e/71/168564-ml-1711709.jpg"].sample,
        category: "Lend",
        condition: "Good"
    )
end 

10.times do 
    bm = Book.create(
    title: Faker::Book.title,
    user: m,
    genre: Faker::Book.genre,
    author: Faker::Book.author
    )

    Listing.create(
        book: bm,
        user: m,
        location: Faker::Nation.capital_city,
        image_url: ["https://cdn.waterstones.com/bookjackets/large/9781/7853/9781785301544.jpg", "http://prodimage.images-bn.com/pimages/9780441005482_p0_v2_s1200x630.jpg", "https://www.booktopia.com.au/http_coversbooktopiacomau/big/9781444910582/0000/the-famous-five-collection-collection-1.jpg", "https://d3ddkgxe55ca6c.cloudfront.net/assets/t1519638244/a/1e/71/168564-ml-1711709.jpg"].sample,
        category: "Swap",
        condition: "Good"
    )
end 

l = Listing.all.first
c = ClosedListing.new(listing: l, exchange_item: "Harry Potter and the Chamber of Secrets", purchaser: m)
book = Book.all.first
l.open_listing = false
l.save 
l.closed_listings << c 
