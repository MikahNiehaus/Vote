require 'pry'
class SessionsController < ApplicationController

    def create
        # binding.pry
       @user = User.find_or_create_by(uid: auth['uid']) do |u|
        # @user = User.new(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end

        session[:user_id] = @user.id

        render 'topics/show'
    end

    private

    def auth
        request.env['omniauth.auth']
    end


end

#  def destroy
#         session.delete("user_id")
#         redirect_to root_path
#     end
