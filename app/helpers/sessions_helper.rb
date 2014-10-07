module SessionsHelper

	def sign_in(user)
		# create a new remember token
		remember_token = User.new_remember_token

		# Throw remember token in cookies
		cookies.permanent[:remember_token] = remember_token

		# assign the created remember token for that user
		user.update_attribute(:remember_token, User.digest(remember_token))

		# if current_user is needed, to not rely on @user
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def current_user?(user)
		user == current_user
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end
end
