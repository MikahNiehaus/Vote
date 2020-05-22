require 'pry'
class SessionsController < ApplicationController 
    # Check that the user has the right authorization to access clients
    #  skip_before_action :authentication_required, only: [:new,:create]
    #  skip_before_action :authentication_required
    # creates new user
    
    def create

      #are you useing facebooke or normal
        if auth == nil
              # binding.pry
             
              @user = User.where(:name => params[:user][:name]).take
              if @user && @user.authenticate(params[:password])
                session[:user] = @user
                session[:current_user] = @user
                redirect_to user_path(@user)
              else
                session[:error_message] = "Wrong password."
              end
        
          #  # Finds the first record matching the specified conditions. 
          #  #  There is no implied ordering so if order matters, you should specify it yourself.
          #   @user = User.find_by(name: params[:user][:name])
          #   # session is the perfect place to put Little bits of data you want to keep around for more than one request.
          #   session[:user] = @user
          #   redirect_to user_path(@user)
    else
      
     hi =  UsersController.facebook(auth)
       
       hi.save
# session is the perfect place to put Little bits of data you want to keep around for more than one request.
session[:user] = hi
session[:current_user] = hi

render 'welcome/home'
    end
     
    end
    

    def destroy
        # session is the perfect place to put Little bits of data you want to keep around for more than one request.
        session.delete("user")
        session.delete("current_user")
        redirect_to root_path
    end
    
  # The keyword private tells Ruby that all methods defined from now on, are supposed to be private. 
  #   They can be called from within the object (from other methods that the class defines), but not from outside.
    private

    def auth
        request.env['omniauth.auth']
    end

    def correct_password?
        User.all.each do |u|
          if u.password_digest == params["authenticity_token"]
            return true
          end
        end
        return false
        end
end 