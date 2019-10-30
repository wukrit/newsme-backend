Rails.application.routes.draw do
  resources :subscriptions, only: [:index, :show, :create, :destroy]
  resources :filters, only: [:index, :show, :create, :destroy]
  resources :sources, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :topics, only: [:index, :show]
  resources :users, only: [:show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
