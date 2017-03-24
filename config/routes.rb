Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'

  resources :reactions
  resources :user_skills
  resources :skills
  resources :users
  # デバッグ用　ユーザー管理一覧
  get '/users_list', to: 'users#list'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # ユーザープロフィールからスキルを追加する用
  post '/users/:user_id/add_skill', to: 'users#add_skill'
  # ユーザープロフィールからスキルに+1を追加する用
  post '/users/:user_id/:skill_id', to: 'users#add_reaction'
  # ユーザープロフィールからスキルを削除する時
  delete '/users/:id/:skill_id', to: 'user_skills#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
