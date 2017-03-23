Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'

  resources :reactions
  resources :user_skills
  resources :skills
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/users/:user_id/add_skill', to: 'users#add_skill'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
