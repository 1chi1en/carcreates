Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations'
   }
  root to: 'articles#index'
  resources :users, only: [:show]
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end


end
