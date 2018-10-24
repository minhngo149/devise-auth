class UserController < ApplicationController

	# api GET /users
	def get_all_users
		
		@users = User.all
		render json: {status: 200, message: "Success data!", data: @users}
	end
end
