class CreateEateryLocations < ActiveRecord::Migration
  def change
    create_table :eatery_locations do |t|
      t.integer :eatery_id
      t.integer :location_id

      t.timestamps
    end
  end
end
