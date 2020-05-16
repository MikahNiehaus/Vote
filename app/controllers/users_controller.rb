class UsersController < ApplicationController
    skip_before_action :authentication_required, only: [:new, :create]
    # skip_before_action :authenticate_user!, :only => [:facebook, :new, :]
    def new 
        @user = User.new
    end 


    def create
 
   if new_user?

    user = User.create(user_params)
    session[:user] = user
    redirect_to user_path(user)
  else
    
     redirect_to signin_path
  end

    end


    def show 
        @user = User.find_by(id: params[:id])
        session[:user] = @user
    end 

    private 
    def new_user?
    User.all.each do |u|
      if u.name == user_params["name"]
        return false
      end
    end
    return true
    end


  def user_params
      params.require(:user).permit(:name, :password)
  end 


end