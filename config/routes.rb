Rails.application.routes.draw do
  root "events#top"
  resources :events do
    collection { get "search" }
  end
  resources :logs
  resources :users
  resource :session, only: [:create, :destroy]
end
