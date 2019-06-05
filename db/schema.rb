# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_05_123754) do

  create_table "authors", force: :cascade do |t|
    t.string "author"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_authors_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "closed_listings", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "purchaser_id"
    t.string "exchange_item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_closed_listings_on_listing_id"
    t.index ["purchaser_id"], name: "index_closed_listings_on_purchaser_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_genres_on_book_id"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.string "location"
    t.string "image_url"
    t.string "category"
    t.string "condition"
    t.boolean "open_listing", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_listings_on_book_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "book_id"
    t.string "body"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_messages_on_book_id"
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
