Rails.application.routes.draw do

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

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :goals
  resources :monthly_plans, only: [:index, :edit, :update]
  resources :weekly_plans, only: [:index, :edit, :update]
  resources :daily_plans, only: [:index, :edit, :update]
  resources :today_jobs, only: [:index]
  resources :problems, only: [:index, :edit, :update]
  resources :directions, only: [:index]
  resources :members, only: [:create, :destroy]

  resources :shared_goals, only: [:index, :update] do
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

  resources :other_users, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resources :relationships, only: [:index, :create, :destroy] do
    collection do
      get :search
    end
  end
end
