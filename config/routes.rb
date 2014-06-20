Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  resources :users
  resources :vocab_lists
  resources :words
  get '/test' => 'vocab_lists#test'
  root to: 'users#show'
end
