Rails.application.routes.draw do
  root 'sessions#new'
  get 'tasks/input'
  get 'tasks/output'
  get 'sessions/destroy'

  resources :users
  resources :sessions

  match '/signup',  to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  post 'sessions/create'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
