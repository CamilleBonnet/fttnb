Rails.application.routes.draw do
  get 'users/show'

  get 'users/edit'

  devise_for :registrations, :controllers => { registrations: "registrations"}

  root to: 'flats#home'

  # routes for the flat model
  resources :flats do
    resources :bookings, only: [:create, :update]
  end
  get '/mybookings', to: "bookings#index"

  # routes for the user model
  get 'users/:id', to: "users#show", as: "user"
  get 'users/profile/edit', to: "users#edit", as: "edit_user_profile"
  patch 'users/profile', to: "users#update", as: "user_profile"
  delete 'users', to: "users#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
