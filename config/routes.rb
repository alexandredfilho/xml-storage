Rails.application.routes.draw do
  root "welcome#index"

  resources :xmls
  resources :stores, only: [:index]
end
