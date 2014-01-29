class Location < ActiveRecord::Base
	has_many :eatery_locations
	has_many :eateries, through: :eatery_locations

	def self.search name
		eateries = []
		self.where("LOWER(name) LIKE ?", "%#{name.downcase}%").each do |l|
			eateries << l.eateries
		end
		eateries.flatten
	end

end
