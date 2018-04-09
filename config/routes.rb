Rails.application.routes.draw do

  resources :books do
    collection { post :import }
  end

  resources :users

end
