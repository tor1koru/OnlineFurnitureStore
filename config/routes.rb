Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:show, :edit, :update]
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show, :new, :create]

  resources :buckets, only: [:show] do
    member do
      post "add_product/:product_id", to: "buckets#add_product", as: :add_product
      delete "remove_product/:product_id", to: "buckets#remove_product", as: :remove_product
    end
  end

  root "products#index"

  # Health check
  get "up", to: "rails/health#show", as: :rails_health_check

  # PWA support
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end