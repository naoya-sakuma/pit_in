Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
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


  get   'todo',    to: 'plans#todo'
  patch 'todo',    to: 'plans#todo_update'
  put   'todo',    to: 'plans#todo_update'
end
