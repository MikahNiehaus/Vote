class SessionsController < ApplicationController
skip_before_action :authentication_required, only: [:new,:create]   
    def create
     
        #     if user = User.find_by(name: params[:user][:name])
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #     else 
    #         render 'new'
    #     end
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.id = User.last.id += 1
        end
#    binding.pry
      session[:user_id] = @user.id

        render 'welcome/home'
    end
     # def create 
    #     # binding.pry

    #     if user = User.find_by(name: params[:user][:name])
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #     else 
    #         render 'new'
    #     end

    # end 

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end


    # def new 

    # end 


    # def create 
    #     # binding.pry

    #     if user = User.find_by(name: params[:user][:name])
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #     else 
    #         render 'new'
    #     end

    # end 


end 