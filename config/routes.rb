Rails.application.routes.draw do
  resources :store_owners
  resources :lojas
  resources :normal_users
  resources :estacionamentos
  devise_for :users
  resources :users

  resources :sessions, only:  [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
