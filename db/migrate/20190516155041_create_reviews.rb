class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.integer :booking_id
      t.timestamps
      t.index ["booking_id"], name: "index_reviews_on_booking_id"
    end
  end
end
