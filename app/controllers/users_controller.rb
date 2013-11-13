class UsersController < ApplicationController

  layout "acount"
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    
    if @user.save
      redirect_to root_url
    else
      render "new"
    end
  end
end
