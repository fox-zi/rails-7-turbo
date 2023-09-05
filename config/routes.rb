Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :quotes
  resources :tasks
end
