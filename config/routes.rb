Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :registrations, :controllers => {
    registrations: "registrations",
    omniauth_callbacks: "registrations/omniauth_callbacks"
  }
  post 'registrations', to: "registrations#create", as: "registration_create"

  root to: 'flats#home'

  # routes for the flat model
  resources :flats do
    resources :bookings, only: [:create, :update]
  end

  get '/mybookings', to: "bookings#index"
  get '/mybookings/:id/edit', to: "bookings#edit", as: "edit_booking"
  # patch '/mybookings/:id', to: "bookings#update", as: "booking"
  delete '/mybookings/:id', to: "bookings#destroy", as: "delete_booking"

  get '/mybookings/accept/:id', to: "bookings#accept", as: "accept_booking"
  get '/mybookings/decline/:id', to: "bookings#decline", as: "decline_booking"
  get '/mybookings/cancel/:id', to: "bookings#cancel", as: "cancel_booking"


  # routes for the user model
  get 'users/:id', to: "users#show", as: "user"
  get 'users/myprofile', to: "users#show", as: "myprofile"
  get 'users/profile/edit', to: "users#edit", as: "edit_user_profile"
  patch 'users/:id', to: "users#update", as: "user_profile"
  delete 'users', to: "users#destroy"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
