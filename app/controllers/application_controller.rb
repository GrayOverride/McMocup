class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	helper_method :current_user

	def sidebar
		@new_article = Article.where("type != 'Commercial'").first(:order => 'created_at DESC')
		@new_com_article = Article.where("type = 'Commercial'").first(:order => 'created_at DESC')
	end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	private
	def authenticate
		if(current_user.nil?)
		  redirect_to log_in_path
		end
	end
end
