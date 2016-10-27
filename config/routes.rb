Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'help'  => 'static_pages#help'
  get 'info' => 'static_pages#info'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'users' => 'users#index'
  resources :users
  resources :account_activations, only: [:edit]
  
end
