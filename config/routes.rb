Rails.application.routes.draw do
  devise_for :users

  root to: 'dashboards#index'

  resources :properties
end
