Rails.application.routes.draw do

  root 'users#index'

  resources :books
  resources :users
  resources :borrows, only: [:new, :create]
  delete 'return' => 'borrows#destroy'
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'

end
