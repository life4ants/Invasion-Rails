Rails.application.routes.draw do
  
  root                 'static_pages#home'
  get    'help'     => 'static_pages#help'
  get    'info'     => 'static_pages#info'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  get    'message'  => 'static_pages#flash'
  get 'static_pages/home'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end

  
