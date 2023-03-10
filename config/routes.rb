Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :musicians do
  resources :bookings, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/bookings/:id/accept', to: 'bookings#accept', as: 'booking_accept'
  get '/bookings/:id/decline', to: 'bookings#decline', as: 'booking_decline'
  get '/bookings/:id/completed', to: 'bookings#completed', as: 'booking_completed'
end
