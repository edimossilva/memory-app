# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth/login' => 'authentication#login'
  get '/auth/sign_up' => 'authentication#sign_up'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  resources :memories, only: %i[create index update destroy]
end
