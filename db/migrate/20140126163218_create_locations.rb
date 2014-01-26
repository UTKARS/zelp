class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :contact_number
      t.integer :eatery_id

      t.timestamps
    end
  end
end
