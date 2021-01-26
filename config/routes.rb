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
  #patch 'monthly_plans', to: 'monthly_plans#monthly_update'
  resources :weekly_plans
  patch 'weekly_plans', to: 'weekly_plans#weekly_update'
  resources :daily_plans
  patch 'daily_plans', to: 'daily_plans#daily_update'

  # get   'monthly', to: 'plans#monthly'
  # patch 'monthly', to: 'plans#monthly_update'
  # put   'monthly', to: 'plans#monthly_update'
  # get   'weekly',  to: 'plans#weekly'
  # patch 'weekly',  to: 'plans#weekly_update'
  # put   'weekly',  to: 'plans#weekly_update'
  # get   'daily',   to: 'plans#daily'
  # patch 'daily',   to: 'plans#daily_update'
  # put   'daily',   to: 'plans#daily_update'
  get   'todo',    to: 'plans#todo'
  patch 'todo',    to: 'plans#todo_update'
  put   'todo',    to: 'plans#todo_update'
end
