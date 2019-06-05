# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

r = User.create(first_name: "Ranjit", last_name: "Saimbi", email: "ranjit.saimbi@gmail.com", username: "Ranjit", password: "12345")
m = User.create(first_name: "Myrto", last_name: "Konstantinidi", email: "myrto.konstantinidi@gmail.com", username: "Myrto", password: "12345")

10.times do 
    br = Book.create(
    title: Faker::Book.title,
    user: r
    )
    gr = Genre.new(
        genre: Faker::Book.genre
    )
    br.genres.push(gr)
    ar = Author.new(
        author: Faker::Book.author
    )
    br.authors.push(ar)

    Listing.create(
        book: br,
        user: r,
        location: Faker::Nation.capital_city,
        image_url: Faker::Placeholdit.image('50x50', 'jpeg', :random, :random),
        category: "Lend",
        condition: "Good"
    )
end 

10.times do 
    bm = Book.create(
    title: Faker::Book.title,
    user: m
    )
    gm = Genre.new(
        genre: Faker::Book.genre
    )
    bm.genres.push(gm)
    am = Author.new(
        author: Faker::Book.author
    )
    bm.authors.push(am)

    Listing.create(
        book: bm,
        user: m,
        location: Faker::Nation.capital_city,
        image_url: Faker::Placeholdit.image('50x50', 'jpeg', :random, :random),
        category: "Swap",
        condition: "Good"
    )
end 