class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params.require(:username), params.require(:password))
  	if user
  		session[:user_id] = user.id

  		redirect_to articles_path, :notice => "Logged in"
  	else

  		redirect_to root_url, :notice => "Error"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out"
  end
end