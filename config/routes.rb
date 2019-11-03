Rails.application.routes.draw do
  resources :news_sources, only: [:index, :show]
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :filters, only: [:index, :create, :destroy]
  resources :articles, only: [:index, :show]
  resources :topics, only: [:index, :show]
  resources :users, only: [:create, :update, :destroy]

  post '/login', to: 'login#login'
  get '/login', to: 'login#persist'

  get '/topics/serve', to: 'topics#serve'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
