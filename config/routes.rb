Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workers#index"

  resources :workers do
    resources :paid_holidays
  end
  resources :paid_holidays
end
