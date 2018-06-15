Rails.application.routes.draw do
  resources :operador_lojas
  resources :operador_estacionamentos
  resources :cards
  resources :dono_estacionamentos

  get 'reservations/normal_user/:normal_user_id', to: 'reservations#normal_user_reservations'
  get 'reservations/estacionamento/:operador_estacionamento_id', to: 'reservations#estacionamento_reservations'
  get 'reservations/today/:operador_estacionamento_id', to: 'reservations#estacionamento_reservations_today'
  get 'reservations/confirm/:reservation_id/:operador_estacionamento_id', to: 'reservations#confirm_reservation'
  put 'reservations/checkin', to: 'reservations#checkin'
  resources :reservations

  get 'vacancies/estacionamento/:estacionamento_id', to: 'vacancies#index_estacionamento'
  resources :vacancies
  
  post 'store_owners/add_credits', to: 'store_owners#add_credit'
  resources :store_owners
  
  resources :lojas
  resources :normal_users

  # ===========  NORMAL_USER
  #                         CARROS  =============
  get "normal_users/:user_id/cars", to: 'normal_users#get_cars'
  post "normal_users/:normal_user_id/newcar", to: 'normal_users#save_car'
  delete "normal_users/:normal_user_id/deletecar/:id", to: 'normal_users#destroy_car'


  #  -------                CARTOES
  get "normal_users/:normal_user_id/cards", to: 'normal_users#get_cartoes'
  post "normal_users/:normal_user_id/newcartao", to: 'normal_users#save_cartao'
  delete "normal_users/:normal_user_id/deletecartao/:id", to: 'normal_users#destroy_cartao'

  get "estacionamentos/operador/:operador_estacionamento_id", to: 'estacionamentos#index_operador'
  resources :estacionamentos

  devise_for :users, :controllers => { 
             :registrations => 'user_registration' }
  resources :users

  resources :sessions, only:  [:create]

  delete "/sessions/:authentication_token", to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
