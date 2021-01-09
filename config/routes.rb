Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'goals#index'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new'
    end
  end
end
