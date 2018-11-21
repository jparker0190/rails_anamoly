Rails.application.routes.draw do
  resources :stocks
  resources :portfolios do
   resources :assignments
  end
  resources :assignments
  #devise_for :users, controllers: {pages: "pages"}
  #sign in with facebook
  get 'auth/facebook/callback' => 'sessions#facebook'
  get 'auth/failure', to: redirect('/')
  root to: 'sessions#welcome'
    # home_path
    get '/home' => 'sessions#home'

    # login_path
    get '/login' => 'sessions#new'
  
    # create_path
    post '/login' => 'sessions#login'
  
    # logout_path
    get '/logout' => 'sessions#logout'

end
