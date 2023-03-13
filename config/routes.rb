Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  get "/dashboard", to: "dashboard#dashboard"
  resources :musicians do
    resources :reviews, only: [:index, :create]
  end

  resources :packages do
    resources :bookings, only: [:new, :create ]
  end

  resources :bookings do
    resources :messages, only: [:new, :create]
  end


  get "/bookings/:id/show_chat", to: "bookings#show_chat", as: "show_chat"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/bookings/:id/accept', to: 'bookings#accept', as: 'booking_accept'
  get '/bookings/:id/decline', to: 'bookings#decline', as: 'booking_decline'
  get '/bookings/:id/completed', to: 'bookings#completed', as: 'booking_completed'
end
# package
