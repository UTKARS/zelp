class CreateEateries < ActiveRecord::Migration
  def change
    create_table :eateries do |t|
      t.string :name
      t.boolean :bar
      t.boolean :home_delievery
      t.boolean :non_veg
      t.string :card_type
      t.boolean :buffet
      t.boolean :outdoor_seating

      t.timestamps
    end
  end
end
