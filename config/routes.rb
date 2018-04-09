Rails.application.routes.draw do

  root 'users#index'

  resources :books do
    collection { post :import }
  end

  resources :users

end
