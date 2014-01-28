class CreateEateryCuisines < ActiveRecord::Migration
  def change
    create_table :eatery_cuisines do |t|
      t.integer :eatery_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
