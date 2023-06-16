Rails.application.routes.draw do
  root "welcome#index"

  resources :xmls
  resources :imported_documents, only: [:index]
end
