Rails.application.routes.draw do

  root 'books#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    resources :users, only: [:show]
  end


  resources :books do
    resources :borrows, only: [:new, :create, :update]
  end





end
