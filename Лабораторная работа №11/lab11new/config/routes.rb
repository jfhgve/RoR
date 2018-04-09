Rails.application.routes.draw do
  root 'tasks#input'

  get 'tasks/input'
  get 'tasks/results'
  get 'tasks/clean'
  get 'tasks/output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
