module SessionsHelper

	# Logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	def remember(user)
	end

	def current_user?(user)

  	end

	# Returns the current logged-in user (if any).
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	def forget(user)
  	end

	def log_out #deletes cookies, session and sets remember_digest to nil
		session.delete(:user_id)
    	@current_user = nil
  	end

  	# Redirects to stored location (or to the default).
  	def redirect_back_or(default)
  	end
	
  	# Stores the URL trying to be accessed.
  	def store_location
  	end
end
