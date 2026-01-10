Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Public read-only routes
  resources :subjects, only: [:index, :show] do
    resources :chapters, only: [:show], shallow: true do
      resources :lessons, only: [:show], shallow: true
    end
  end

  # Admin namespace for write operations (protected by HTTP Basic Auth)
  namespace :admin do
    root "dashboard#index"
    get "dashboard", to: "dashboard#index"

    resources :subjects, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :chapters, only: [:new, :create], shallow: true
    end

    resources :chapters, only: [:show, :edit, :update, :destroy] do
      resources :lessons, only: [:new, :create], shallow: true
    end

    resources :lessons, only: [:show, :edit, :update, :destroy] do
      resources :words, only: [:new, :create], shallow: true
    end

    resources :words, only: [:edit, :update, :destroy]
  end

  # Root path
  root "subjects#index"
end
