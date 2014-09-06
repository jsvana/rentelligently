Rails.application.routes.draw do
  devise_for :users

  root to: 'dashboards#index'

  resources :landings, only: [:index]

  resources :properties do
    resources :issues, except: [:index]
    resources :utilities do
			post :pay
		end
  end

  resources :users, only: [:show, :edit, :update]
end
