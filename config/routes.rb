Rails.application.routes.draw do
 root "welcome#index"

 resources :xml_contents
end
