Rails.application.routes.draw do

  root 'users#index'

  resources :books do
    collection { post :import }
  end

  resources :users
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'

end
