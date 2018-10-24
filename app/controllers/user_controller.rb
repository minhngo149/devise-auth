class UserController < ApplicationController

	# api GET /users
	def get_all_users

		# conditions from body request
		@users = User.where("nickname like ?", "%#{params[:keyword]}%").all
		render json: {status: 200, message: "Success data!", data: @users}
	end
end
