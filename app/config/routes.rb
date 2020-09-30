Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  resources :memories, only: %i[create]
end
