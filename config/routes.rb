Airbnb::Application.routes.draw do
 devise_for :users
 root to: "properties#index"
 resources :users
 resources :properties
 resources :reservations
end
