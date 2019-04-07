Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   get 'sessions/new'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   root 'users#home'


   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'
   get '/logout',  to: 'sessions#destroy'
   get  '/update',  to: 'users#edit'
   patch '/update',  to: 'users#update'
   get '/search', to: 'search#index'
   get 'search/results' => 'search#show'
   get '/index', to: 'users#index'

   resources :users
end
