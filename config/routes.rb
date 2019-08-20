Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens do
    resources :reviews, only: [:create]
    resources :bookings, only: [:create, :edit, :update]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
