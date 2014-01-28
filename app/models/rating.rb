class Rating < ActiveRecord::Base

	belongs_to :users
	belongs_to :eateries

	def self.created(eatery_id, user)
		rating = user.ratings.where(eatery_id: eatery_id).first
		rating.nil? ? nil : rating	
	end

end
