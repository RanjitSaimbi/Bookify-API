class CreateClosedListings < ActiveRecord::Migration[5.2]
  def change
    create_table :closed_listings do |t|
      t.references :listing, foreign_key: true
      t.references :purchaser
      t.string :exchange_item

      t.timestamps
    end

    add_foreign_key :closed_listings, :users, column: :purchaser_id , primary_key: :id

  end
end
