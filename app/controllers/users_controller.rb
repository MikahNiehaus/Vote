class UsersController < ApplicationController
    # Check that the user has the right authorization to access clients.
    skip_before_action :authentication_required, only: [:new, :create]
    # skip_before_action :authenticate_user!, :only => [:facebook, :new, :]
    def new 
        @user = User.new
    end 


    def create
 
   if new_user?
    user = User.create(user_params)
    # session is the perfect place to put Little bits of data you want to keep around for more than one request.
    session[:user] = user
    redirect_to user_path(user)
  else
    # Redirects the browser to the target specified in options. This parameter can be any one of:
     redirect_to signin_path
  end

    end


    def show 
        # Finds the first record matching the specified conditions. 
        #  There is no implied ordering so if order matters, you should specify it yourself.
        @user = User.find_by(id: params[:id])
        # session is the perfect place to put Little bits of data you want to keep around for more than one request.
        session[:user] = @user
    end 
    
  # The keyword private tells Ruby that all methods defined from now on, are supposed to be private. 
  #   They can be called from within the object (from other methods that the class defines), but not from outside.
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