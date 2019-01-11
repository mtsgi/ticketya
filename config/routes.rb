Rails.application.routes.draw do
  namespace :admin do
  get 'top/index'
  end

  root "events#top"
  resources :events do
    collection { get "search" }
  end
  resources :logs
  resources :users
  resource :session, only: [:create, :destroy]

  namespace :admin do
    root to: "top#index"
    resources :events do
      collection { get "search" }
    end
    resources :tickets
    resources :logs
    resources :users
    resource :session, only: [:create, :destroy]
  end
end