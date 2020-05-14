class UsersController < ApplicationController
    skip_before_action :authentication_required, only: [:new, :create]
    # skip_before_action :authenticate_user!, :only => [:facebook, :new, :]
    def new 
        @user = User.new
    end 

    def self.facebook
         binding.pry
     @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.id = 1
        end

        session[:user_id] = @user.id

        render 'welcome/home'
    end

    def create
#    binding.pry
   if (user = User.create(name: user_params["name"], password_digest: user_params["password"]))
    session[:user] = user
    redirect_to user_path(user)
  else
    render 'new'
  end
    end

    def show 
        # binding.pry
        @user = User.find_by(id: params[:id])
        session[:user] = @user
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password) 
    end 

end