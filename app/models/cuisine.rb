class Cuisine < ActiveRecord::Base
	has_many :eatery_cuisines
	has_many :eateries, through: :eatery_cuisines

	def has_eateries
		eateries = []
		Cuisine.where(name: self.name).each {|c| eateries << c.eateries.first }
		eateries
	end

end
