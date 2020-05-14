class SessionsController < ApplicationController
    skip_before_action :authentication_required, only: [:new,:create]   
    def create
      
        if auth == nil
        if user = User.find_by(name: params[:user][:name])
            session[:user] = user
            redirect_to user_path(user)
        else 
            render 'new'
        end

    else
       
        # binding.pry
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end

        session[:user] = @user
        current_user = @user
        render 'welcome/home'
        # binding.pry
    end
     
    end
    

    def destroy
        session.delete("user")
        redirect_to root_path
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end


end 