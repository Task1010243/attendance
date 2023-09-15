Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workers#index"

  get "/workers", to: "workers#index"
  get "/workers/:id", to: "workers#show"
end
