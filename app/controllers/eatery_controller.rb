class EateryController < ApplicationController

	def search
		eateries = Eatery.search params[:name]
		cuisine_eateries = Cuisine.search params[:name]
		location_eateries = Location.search params[:name]

		if params[:name].empty?
			@results = Eatery.all
		elsif !eateries.empty?
			@results = eateries
		elsif !cuisine_eateries.empty?
			@results = cuisine_eateries
		elsif !location_eateries.empty?
			@results = location_eateries
		else
			flash.now[:alert] = "We're sorry, No match found."
		end

	end

	def index
		@results = Eatery.order("created_at").all
	end

	def show
		@eatery = Eatery.find(params[:id])
	end

	def review			
		if !user_signed_in?
			session[:next] ||= request.referer
			return redirect_to new_user_session_path, alert: "Please sign in before you make a post." 			
		end
		return redirect_to :back, alert: "Please write something before you post." if params[:review].empty? 
		current_user.reviews.create(content: params[:review], eatery_id: params[:id] )
		redirect_to :back, notice: "Review posted Successfully"
	end

	def assign_ratings
		# puts "============================================"
		# p params
		rating = Rating.created params[:eatery_id], current_user
		# puts "====rating result"
		# p rating.inspect
		eatery = Eatery.find(params[:eatery_id])
		votes = eatery.votes
		votes = 0 if votes.nil?
		if rating.nil?
			# puts " ====================rating create"
			current_user.ratings.create(value: params[:rating], eatery_id: params[:eatery_id])
			votes = votes + 1
		else
			# puts " ==========================rating update"
			rating.update_attributes(value: params[:rating])
		end
		eatery.calculate_rating(votes) 
		# puts "=================================raitng"
		render :json => { :ratings => eatery.rating, :votes => eatery.votes }
	end

end