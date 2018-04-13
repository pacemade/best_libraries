Rails.application.routes.draw do

  root 'books#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    resources :users, only: [:show] do
      resources :notifications, only: [:create, :update]
    end
  end

  resources :libraries
  resources :copies, only: [:create, :update, :edit]

  resources :books do
    resources :borrows, only: [:create, :update]
  end

end
