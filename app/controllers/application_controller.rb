require 'pry'
class ApplicationController < ActionController::Base
  # Turn on request forgery protection. Bear in mind that GET and HEAD requests are not checked.
  #  protect_from_forgery with: :exception
  # Check that the user has the right authorization to access clients.
  # before_action :authentication_required
  # helper class method can receive and evaluate a block, making the methods defined available to the template
  # helper_method :current_user

  # The keyword private tells Ruby that all methods defined from now on, are supposed to be private. 
  #   They can be called from within the object (from other methods that the class defines), but not from outside.
  private 

  def authentication_required
    if !logged_in?
    # Redirects the browser to the target specified in options. This parameter can be any one of:
      redirect_to '/'
    end 
  end 
#cheacks if it is logged in
  def logged_in?
    # session is the perfect place to put Little bits of data you want to keep around for more than one request.
    !!session["user"]
  end
  # def current_user

  #   session["user"]
  #   User.find_by(id:session[:user].id)
  # end 

end