Rails.application.routes.draw do
  get 'sessions/new'

  resources :reactions
  resources :user_skills
  resources :skills
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
