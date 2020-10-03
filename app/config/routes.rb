Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  resources :memories, only: %i[create index update destroy]
end
