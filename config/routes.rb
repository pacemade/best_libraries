Rails.application.routes.draw do

  root 'users#index'

  resources :books
  resources :users
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'
  resources :borrows, only: [:new, :create]
  delete 'return' => 'borrows#destroy'


end
