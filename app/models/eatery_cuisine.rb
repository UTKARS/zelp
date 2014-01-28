class EateryCuisine < ActiveRecord::Base
	belongs_to :eatery
	belongs_to :cuisine
end
