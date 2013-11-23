class SessionsController < ApplicationController

  layout "acount"
  
  def new
  end

  def create
    if params[:username].present? && params["password"].present?
  	 user = User.authenticate(params.require(:username), params.require(:password))

    	if user
    		session[:user_id] = user.id

    		redirect_to articles_path, :notice => "Logged in"
    	else
    		redirect_to log_in_path, :notice => "Invalid credentials"
    	end
    else
      redirect_to log_in_path, :notice => "An error occured, please make sure your information is correct"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out"
  end
end