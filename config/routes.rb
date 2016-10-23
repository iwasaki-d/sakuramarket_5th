Rails.application.routes.draw do

  resource :cart, only: %w(show edit update) do
    member do
      post 'update_cart_by_user'
      post 'order'
    end
  end

  devise_for :users

  resources :commodities, only: %w(show)
  resources :cart_commodities, only: %w(create update)

  namespace :admin do
    resources :users, only: %w(index edit update delete)
    resources :commodities

    root to: 'home#index'
  end

  root to: 'home#index'
end
