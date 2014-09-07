Rails.application.routes.draw do
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	get '/auth/venmo/callback' => 'users/omniauth_callbacks#venmo'

  root to: 'dashboards#index'

  resources :landings, only: [:index]

  resources :properties do
    resources :issues, except: [:index] do
      post :fix
    end
    resources :utilities do
      post :pay
    end
    resources :rental_terms, only: [:new, :create, :edit, :update]
  end

  resources :users, only: [:show, :edit, :update]

  resources :forums, only: [:show, :index] do
    resources :posts, only: [:show, :new, :create]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create]
  end
end
