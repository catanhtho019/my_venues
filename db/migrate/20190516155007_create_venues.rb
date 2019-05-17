class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.string :category
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
