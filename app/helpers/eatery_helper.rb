module EateryHelper

	def cards_acceptance restaurant
		restaurant.card_type == 'credit' ? 'accepted' : 'not accepted'
	end

	def seating_plan_for restaurant
		restaurant.outdoor_seating ? 'Yes' : 'No'
	end

	def is_non_veg restaurant
		restaurant.non_veg ? 'Yes' : 'No'
	end

	def has_bar restaurant
		restaurant.bar ? 'Yes' : 'No'
	end

	def rating restaurant
		restaurant.rated? ? restaurant.rating : 'Not rated'
	end

end
