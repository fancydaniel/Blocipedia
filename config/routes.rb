Rails.application.routes.draw do

  get "log_out" => 'sessions#destroy', :as => "log_out"
  get "log_in" => 'sessions#new', :as => "log_in"
  get "sign_up" => 'users#new', :as => "sign_up"


  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
  resources :users
  resources :sessions
  resources :password_resets
 
end
