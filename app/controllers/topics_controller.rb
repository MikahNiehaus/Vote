require 'pry'
class TopicsController < ApplicationController

    def index 
        # biranding.pry
        @topics = Topic.all 
        # session is the perfect place to put Little bits of data you want to keep around for more than one request.
        @user = session[:user]
    end 

    def show 
            #binding.pry             
        # Finds the first record matching the specified conditions. 
        #  There is no implied ordering so if order matters, you should specify it yourself.
        @topic =  Topic.where(id: params[:id]).take
        @vote = Vote.new(user_id: session[:user]["id"], topic_id: @topic.id)
        # session is the perfect place to put Little bits of data you want to keep around for more than one request.
        @user = session[:user]

    end 

    def new
        
        @topic = Topic.new
       # binding.pry
    end 

    def create 
        #  binding.pry
        @topic = Topic.create(name: topic_params[:name], user_id: session[:user]["id"])
        # Redirects the browser to the target specified in options. This parameter can be any one of:
        redirect_to topic_path(@topic)

    end 

    def destroy
        @topic = Topic.where(params[:id]).take
        # Redirects the browser to the target specified in options. This parameter can be any one of:
        redirect_to user_path(@topic.user_id)
        
        @topic.destroy
       
      end
    
  # The keyword private tells Ruby that all methods defined from now on, are supposed to be private. 
  #   They can be called from within the object (from other methods that the class defines), but not from outside.
    private 
    def topic_params
        params.require(:topic).permit(:name) 
    end 

end


