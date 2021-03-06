class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :book, foreign_key: true
      t.string :body
      t.boolean :read, :default => false
      t.references :sender
      t.references :recipient

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id
    add_foreign_key :messages, :users, column: :recipient_id, primary_key: :id
  end
end
