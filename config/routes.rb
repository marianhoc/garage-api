Rails.application.routes.draw do
  resources :parceiros
  resources :estacionamentos
  devise_for :users
  resources :users

  resources :sessions, only:  [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
