Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'users#index', as: :authenticated_root
  end

  root 'home#index'

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy], shallow: true do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  resources :posts, only: [] do
    resources :likes, only: [:create]
  end

  
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end
