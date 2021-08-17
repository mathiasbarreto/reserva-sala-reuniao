Rails.application.routes.draw do
  devise_for :users
  root to: 'bookings#index'
  resources :bookings, only: [:index, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
