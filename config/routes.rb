Rails.application.routes.draw do
  root "events#top"
  resources :events do
    collection { get "search" }
  end
end
