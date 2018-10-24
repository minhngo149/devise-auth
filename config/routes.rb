Rails.application.routes.draw do
	get '/users', to: 'user#get_all_users'

	mount_devise_token_auth_for 'User', at: 'auth'
	mount_devise_token_auth_for "Admin", at: 'admin_auth'
end
