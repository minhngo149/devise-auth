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

	# add user api
	def add_new_user
		
		@user = User.new(user_params)

		# xu li them data de luu xuong db user
		if @user.save
			render json: {status: 200, message: "Success!", data: @user}
		else
			render json: {status: 400, message: "Error!", data: @user.errors.full_messages}
		end
	end


	private
		def user_params
			params.require(:user).permit(:nickname, :mail_address, :password, :password_confirmation, :uid)
		end
end