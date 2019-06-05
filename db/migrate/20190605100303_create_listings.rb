class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.string :location
      t.string :image_url
      t.string :category
      t.string :condition
      t.boolean :open_listing, :default => true 

      t.timestamps
    end
  end
end
