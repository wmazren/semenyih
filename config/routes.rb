Semenyih::Application.routes.draw do
  devise_for :users, :path_prefix => 'd'

  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session,
      :via => Devise.mappings[:user].sign_out_via
  end

  resources :users

  devise_for :physicians, :path_prefix => 'd', :skip => :sessions
  resources :physicians

  resources :organizations
  resources :patients
  resources :appointments
  resources :dashboards, :only => [:index]

  get 'pricing' => 'static#pricing', :as => :static_pricing
  get 'features' => 'static#features', :as => :static_features

  root :to => 'home#index'
end
