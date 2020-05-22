class UsersController < ApplicationController
    # Check that the user has the right authorization to access clients.
      # skip_before_action :authentication_required, only: [:new, :create]
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
 
end
    def create
    #  binding.pry
     user = User.new(user_params)
    if user.valid?
      user.save
      session[:user] = user
      redirect_to user_path(user)
    else
      # errors.add(:signup, "same username or no password.")
      
      user.errors.details[:name] 
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
    


  def user_params
      params.require(:user).permit(:name, :password)
  end 


end