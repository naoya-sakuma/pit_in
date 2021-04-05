Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    authenticated :user do
      root to: 'goals#index'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new'
    end
  end
  resources :goals
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users
  resources :monthly_plans
  resources :weekly_plans
  resources :daily_plans
  resources :today_jobs
  resources :problems
  resources :directions
  resources :shared_goals do
    collection do
      get :search
    end
  end
  resources :communities do
    resources :comments
    collection do
      get :search
      get :management
    end
  end
  resources :members, only: [:create, :destroy]
  resources :other_users, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :relationships, only: [:index, :create, :destroy]
end
