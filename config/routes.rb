Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  resources :subscriptions, only: %i[index show create destroy]
  resources :filters, only: %i[index show create destroy]
  resources :sources, only: %i[index show]
  resources :articles, only: %i[index show]
  resources :topics, only: %i[index show]
  resources :users, only: %i[show create update destroy]
=======
  resources :news_sources
  resources :subscriptions
  resources :filters
  resources :articles
  resources :topics
  resources :users
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
=======
  resources :news_sources, only: [:index, :show]
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :filters, only: [:index, :create, :destroy]
  resources :articles, only: [:index, :show]
  resources :topics, only: [:index, :show]
  resources :users, only: [:show, :create, :update, :destroy]

  post '/login', to: 'login#login'
  get '/login', to: 'login#persist'
>>>>>>> cae14c1... updated routes, added jwt
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
