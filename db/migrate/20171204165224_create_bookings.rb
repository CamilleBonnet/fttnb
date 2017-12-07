class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.string :start_booking
      t.string :end_booking
      t.string :price_booking
      t.string :status

      t.timestamps
    end
  end
end
