Rails.application.routes.draw do
  resources :news_sources, only: [:index]
  resources :topics, only: [:index]
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :filters, only: [:index, :create, :destroy]
  resources :articles, only: [:index, :show]
  resources :users, only: [:create, :update, :destroy]

  post '/login', to: 'login#login'
  get '/login', to: 'login#persist'

  get '/topics/serve', to: 'topics#serve'
  get '/users/feed', to: 'users#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
