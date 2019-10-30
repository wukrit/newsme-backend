Rails.application.routes.draw do
  resources :subscriptions, only: %i[index show create destroy]
  resources :filters, only: %i[index show create destroy]
  resources :sources, only: %i[index show]
  resources :articles, only: %i[index show]
  resources :topics, only: %i[index show]
  resources :users, only: %i[show create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
