class AddingColumnsToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :price, :integer
    add_column :venues, :post_code, :string
    add_column :venues, :photo, :string
    add_column :venues, :user_id, :integer
    add_column :bookings, :checkin_on, :date
    add_column :bookings, :checkout_on, :date
    add_column :bookings, :value, :integer
    add_column :bookings, :status, :string
    add_column :bookings, :user_id, :integer
    add_column :bookings, :venue_id, :integer
    add_column :reviews, :rating, :integer
    add_column :reviews, :booking_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
  end
end
