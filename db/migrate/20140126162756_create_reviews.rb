class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.float :rating
      t.integer :eatery_id
      t.integer :user_id

      t.timestamps
    end
  end
end
