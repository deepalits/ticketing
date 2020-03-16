Rails.application.routes.draw do
  root 'events#index'
  resources :users
  resources :events do
    resources :user_events, only: %i[create update new]
  end
  resources :user_events, only: [] do
    resources :orders
  end
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
