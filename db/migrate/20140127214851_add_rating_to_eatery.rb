class AddRatingToEatery < ActiveRecord::Migration
  def change
    add_column :eateries, :rating, :float
    add_column :eateries, :votes, :integer
  end
end
