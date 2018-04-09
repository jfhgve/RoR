Rails.application.routes.draw do
  root 'friendsfun#input'
get '/check_friend' => 'friendsfun#view'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
