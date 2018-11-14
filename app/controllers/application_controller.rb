class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
    helpers do
    # authenticate that user is signed in if not redirect back to login page
      def redirect_if_not_logged_in
          if !logged_in?
            redirect "/login"
          end
      end
    #checks if its the current user
        def logged_in?
          !!current_user
        end
    #authenticates the current user id stored in sessions
        def current_user
          @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
    end
end
