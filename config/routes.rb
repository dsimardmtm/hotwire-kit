Rails.application.routes.draw do
  resources :kits do
    collection do
      get :kit_options
    end
  end
  resources :buttons
  resources :linings
  resources :fabrics
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "kits#index"
end
