Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :tasks do
    resources :line_item_dates, except: [:index, :show]
  end
end
