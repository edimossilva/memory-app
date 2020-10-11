# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/login/sign_up' => 'logins#sign_up'
  resources :memories, only: %i[create index update destroy]
end
