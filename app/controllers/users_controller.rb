class UsersController < ApplicationController
	def show
		puts '=' * 25 + 'users#show' + '=' * 25
		puts params
		puts '=' * 25 + 'users#show' + '=' * 25
		@user = User.find(params[:id])
	end
end
