class Eatery < ActiveRecord::Base
	has_many :cuisines
	has_many :reviews
	has_many :locations
end
