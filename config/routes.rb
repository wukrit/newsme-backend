Rails.application.routes.draw do
<<<<<<< HEAD
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
=======
  resources :news_sources, only: [:index]
<<<<<<< HEAD
>>>>>>> 4593c08... removed extra news_source route
=======
  resources :topics, only: [:index]
>>>>>>> 915a4ab... created index for sources and topics
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :filters, only: [:index, :create, :destroy]
  resources :articles, only: [:index, :show]
  resources :users, only: [:create]

  post '/login', to: 'login#login'
  get '/login', to: 'login#persist'
<<<<<<< HEAD
>>>>>>> cae14c1... updated routes, added jwt
=======

  get '/topics/serve', to: 'topics#serve'
<<<<<<< HEAD
>>>>>>> 623a263... added serve route and method for topics controller
=======
  get '/users/feed', to: 'users#feed'
<<<<<<< HEAD
>>>>>>> af47ad2... added feed route for users
=======
  get '/users/subscriptions', to: 'users#subscriptions'
<<<<<<< HEAD
>>>>>>> bbdbf1c... added subscriptions route for users
=======
  patch '/users/edit', to: 'users#edit'
<<<<<<< HEAD
>>>>>>> 0ec5a6b... implemented edit user method
=======
  get '/users/delete', to: 'users#delete_account'
>>>>>>> 2289c2c... created delete account action
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
