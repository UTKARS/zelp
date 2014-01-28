Zelp::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :eatery, :only =>[:index, :show] do
  	collection do 
  		get :search
      post :assign_ratings
  	end
  	member do 
  		post :review
  	end
  end

  # You can have the root of your site routed with "root"
  root 'main#home'
end
