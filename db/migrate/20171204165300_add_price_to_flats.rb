class AddPriceToFlats < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :price, :float
  end
end
