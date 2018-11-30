class SessionsController < ApplicationController
 before_action :require_login, only: [:logout]
 before_action :set_user, only: [:home]

 def welcome
 end

 def home
 end

 # only called when signing in with Facebook
 def facebook
     @user = User.find_or_create_by(uid: auth['uid']) do |c|
         c.name = auth['info']['name']
         c.email = auth['info']['email']
         c.password = SecureRandom.urlsafe_base64
     end
     if @user.save
         session[:user_id] = @user.id
         redirect_to home_path
     else
         redirect_to root_path
     end
 end

 private

 def auth
     request.env['omniauth.auth']
 end
end