Rails.application.routes.draw do
  resources :stocks
  resources :portfolios do
   resources :assignments
  end
  resources :assignments
  devise_for :users
  get 'pages/home'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
