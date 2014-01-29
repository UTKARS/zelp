class Cuisine < ActiveRecord::Base
	has_many :eatery_cuisines
	has_many :eateries, through: :eatery_cuisines

	def self.search name
		eateries = []
		self.where("LOWER(name) LIKE ?", "%#{name.downcase}%").each do |c|
			eateries << c.eateries
		end
		eateries.flatten
	end

end
