Rails.application.routes.draw do
  
  root                 'static_pages#home'
  get    'help'     => 'static_pages#help'
  get    'info'     => 'static_pages#info'
  get    'game'     =>  'static_pages#game'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  get    'message'  => 'static_pages#flash'
  post   '/games/:id'       => 'games#join'
  get    '/games/:id/play'  => 'games#play', as: :play

  resources :games
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end

  
