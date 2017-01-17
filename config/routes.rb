Rails.application.routes.draw do

  root                 'static_pages#home'
  get    'help'     => 'static_pages#help'
  get    'info'     => 'static_pages#info'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  get    'message'  => 'static_pages#flash'

  get    '/games/:id/play'          => 'games#play', as: :play
  get    '/games/:id/players'       => 'players#index'
  get    '/games/mess'              => 'games#mess'
  get    'games/refresh'            => 'games#refresh_gon'
  post   'games/refresh'            => 'games#initial_troops'

  resources :players
  resources :games
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


  mount ActionCable.server => '/cable'
end
