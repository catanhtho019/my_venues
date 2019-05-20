Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :venues
  resources :users
  resources :venues do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :destroy, :update] do
    resources :reviews, only: [:create, :index, :show]
  end

  namespace :user do
    resources :venues, only: [:index]
    resources :bookings, only: [:index, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

