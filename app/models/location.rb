class Location < ActiveRecord::Base
	has_many :eatery_locations
	has_many :eateries, through: :eatery_locations

	def has_eateries
		eateries = []
		Location.where(name: self.name).each {|l| eateries << l.eateries.first }
		eateries
	end
end
