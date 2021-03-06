Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end
  resources :categories, only: [:show]
  resource :cart, only: [:show] do
    put :add_item
    put :set_email
    delete :remove_item
  end
  resources :orders, only: [:create, :show]
  resources :users, only: [:create, :new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show]
  end
end
