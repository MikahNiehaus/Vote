class UsersController < ApplicationController
    # Check that the user has the right authorization to access clients.
    #  skip_before_action :authentication_required, only: [:new, :create]
      # skip_before_action :authentication_required
      
    def new 
        @user = User.new
    end 

def self.facebook(auth)
  #  binding.pry 
  # auth.require(:info).permit(:name, :email)
  @user = User.find_by(:name => auth['info']['name'])
  if !(@user = User.find_by(:name => auth['info']['name']))
  @user = User.create(password: auth['uid']) do |u|
    u.name = auth['info']['name']
    u.email = auth['info']['email']
    # u.image = auth['info']['image']
end
end
auth.clear


return @user
# binding.pry
end
    def create
 
   if new_user?
    # binding.pry
    user = User.create(user_params)
    # session is the perfect place to put Little bits of data you want to keep around for more than one request.
    # binding.pry
    session[:user] = user
    redirect_to user_path(user)
  else
    # Redirects the browser to the target specified in options. This parameter can be any one of:
     redirect_to signin_path
  end

    end


    def show 
      # binding.pry
    # @user = User.find_by(id: params[:id])
    @user = session[:user] 
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