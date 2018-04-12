Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_prefix =>'auth'
  root 'books#index'

  resources :books do
    resources :borrows, only: [:new, :create, :update]
  end

  resources :users
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'



end
