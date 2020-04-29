Rails.application.routes.draw do
  resources :news_sources, only: [:index]
  resources :topics, only: [:index]
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :filters, only: [:index, :create, :destroy]
  resources :articles, only: [:index, :show]
  resources :users, only: [:create]

  post '/login', to: 'login#login'
  get '/login', to: 'login#persist'

  get '/topics/serve', to: 'topics#serve'
  get '/users/feed', to: 'users#feed'
  get '/users/subscriptions', to: 'users#subscriptions'
  patch '/users/edit', to: 'users#edit'
  get '/users/delete', to: 'users#delete_account'
  post '/users/check_email', to: 'users#check_email'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
