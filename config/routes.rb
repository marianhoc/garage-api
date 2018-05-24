Rails.application.routes.draw do
  post 'store_owners/add_credits', to: 'store_owners#add_credit'
  resources :store_owners
  resources :lojas
  resources :normal_users
  resources :estacionamentos
  devise_for :users, :controllers => { :registrations => 'user_registration' }
  resources :users

  resources :sessions, only:  [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
