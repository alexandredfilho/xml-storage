Rails.application.routes.draw do
  root "welcome#index"

  resources :xmls, except: [:edit, :update]
end
