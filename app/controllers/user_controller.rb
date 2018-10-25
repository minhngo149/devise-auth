class UserController < ApplicationController

	# api GET /users
	def get_all_users

		# conditions from body request
		@users = User.where("register_date >= ?", params[:created_from]).all

		# @users = User.where("nickname like ?", "%#{params[:keyword]}%").all
		# @users = User.where("current_coin > ?", params[:point].to_i).all
		# @users = User.where("gender = ?", params[:gender].to_i).all
		render json: {status: 200, message: "Success data!", data: @users}
	end
end