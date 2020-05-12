class WelcomeController < ApplicationController
     skip_before_action :authentication_required, only: [:home]

    # def home 
    # end
    def home
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end
end