class WelcomeController < ApplicationController
   # skip_before_action callback supports callbacks (methods) to be skipped. It supports two options.
   #   only - The callback should be run only for this action.
   #   except - The callback should be run for all actions except this action.
    #  skip_before_action :authentication_required, only: [:home]
    # before_action :require_logged_in
    def home
      # if session[:user_id]
      #   @user = User.find(session[:user_id])
      # end
    end
end