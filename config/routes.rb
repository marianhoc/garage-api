Rails.application.routes.draw do
  resources :users
<<<<<<< HEAD
=======
  resources :sessions, only:  [:create, :destroy]
>>>>>>> new-login
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
