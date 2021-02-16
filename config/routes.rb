Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    authenticated :user do
      root to: 'users#show'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new'
    end
  end
  resources :goals
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :monthly_plans
  resources :weekly_plans
  resources :daily_plans
  resources :today_jobs
  resources :problems
  resources :directions
  resources :shared_goals do
  end
  resources :communities do
    resources :comments
  end
  get "shared_goal/searched_result_goals", to: "shared_goals#search"
  get "community/searched_result_communities", to: "communities#search"
  resources :members, only: [:create, :destroy]
end
