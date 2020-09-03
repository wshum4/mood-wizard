Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  get '/prev_activities', to: 'pages#prev_activities'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :moods, only: [:new, :create]
  resources :mediums, only: [:index]
  resources :activities, only: [:index, :show] do
    resources :ratings, only: [:new, :create]
  end
  resources :user_actions, only: [:create]
end
