Rails.application.routes.draw do
  resources :cards
  resources :dono_estacionamentos
  resources :reservations
  resources :vacancies
  post 'store_owners/add_credits', to: 'store_owners#add_credit'
  resources :store_owners
  resources :lojas
  resources :normal_users

  get "normal_users/:user_id/cars", to: 'normal_users#get_cars'
  post "normal_users/:normal_user_id/newcar", to: 'normal_users#save_car'
  delete "normal_users/:normal_user_id/deletecar/:id", to: 'normal_users#destroy_car'


  resources :estacionamentos
  devise_for :users, :controllers => { 
             :registrations => 'user_registration' }
  resources :users

  resources :sessions, only:  [:create]

  delete "/sessions/:authentication_token", to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
