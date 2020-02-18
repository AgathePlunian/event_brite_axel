Rails.application.routes.draw do
	root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	# EVENTS
	resources :events

	# USERS COMPLEMENT - ONLY SHOW
	resources :users, only: [:index, :show, :edit, :update]
end
