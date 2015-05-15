Rails.application.routes.draw do
  devise_for :users
  get '/topartists', to: 'topartists#index'
  put '/scores', to: 'scores#update'

  get '/home', to: 'game#home'
  root 'game#home'

  get '/show', to: 'game#show'

end
