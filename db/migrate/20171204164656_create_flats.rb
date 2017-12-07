class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.integer :nb_rooms
      t.integer :nb_people_max
      t.boolean :pets_allowed
      t.boolean :wifi_available
      t.string :wifi_pwd
      t.string :description
      t.boolean :pick_up_services
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
