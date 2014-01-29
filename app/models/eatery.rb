class Eatery < ActiveRecord::Base
	has_many :eatery_cuisines
	has_many :cuisines, through: :eatery_cuisines
	has_many :reviews
	has_many :eatery_locations
	has_many :locations, through: :eatery_locations

	has_many :ratings

	scope :search, ->(name) { where("LOWER(name) LIKE ?", "%#{name.downcase}%") }
	
	def get_cuisines
		cuisines = []
		self.cuisines.each {|c| cuisines << c.name}
		cuisines.join(', ')
	end

	def get_locations
		locations = []
		self.locations.each {|c| locations << c.name}
		locations.join(', ')
	end

	def calculate_rating votes
		total_value = 0
		self.ratings.each {|rating| total_value = total_value + rating.value }
		self.update_attributes(votes: votes, rating: total_value / votes)
	end

	def rated?
		self.rating.nil? ? false : true
	end

end
