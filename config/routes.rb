Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens do
    resources :reviews, only: [:create]
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :bookings, only: [:show, :edit, :update]
  end
  resources :bookings, only: [:destroy, :index]
  resources :reviews, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
