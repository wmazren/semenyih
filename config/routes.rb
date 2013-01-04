Semenyih::Application.routes.draw do
  devise_for :users, :path_prefix => 'd'
  resources :users

  devise_for :physicians, :path_prefix => 'd', :skip => :sessions
  resources :physicians

  resources :organizations
  resources :patients
  resources :appointments
  resources :dashboards

  root :to => 'home#index'
end
