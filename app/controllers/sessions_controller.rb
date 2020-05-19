class SessionsController < ApplicationController
    # Check that the user has the right authorization to access clients
    skip_before_action :authentication_required, only: [:new,:create]
    
    # creates new user
    def create

      #are you useing facebooke or normal
        if auth == nil
            #   binding.pry
                  
           # Finds the first record matching the specified conditions. 
           #  There is no implied ordering so if order matters, you should specify it yourself.
            @user = User.find_by(name: params[:user][:name])
            # session is the perfect place to put Little bits of data you want to keep around for more than one request.
            session[:user] = @user
            redirect_to user_path(@user)
    else
        # binding.pry
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
        # session is the perfect place to put Little bits of data you want to keep around for more than one request.
        session[:user] = @user
        render 'welcome/home'
        # binding.pry
    end
     
    end
    

    def destroy
        # session is the perfect place to put Little bits of data you want to keep around for more than one request.
        session.delete("user")
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