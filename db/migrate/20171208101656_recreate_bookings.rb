class RecreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.date :start_booking
      t.date :end_booking
      t.string :price_booking
      t.string :status
      t.integer :nb_night
      t.timestamps
    end
  end
end
