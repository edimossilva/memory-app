# frozen_string_literal: true

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login
  # POST /auth/login
  def login
    user = User.find_by(username: login_params[:username])

    if user&.authenticate(login_params[:password])
      json = user_to_auth_json(user)
      render json: json, status: :ok
    else
      render_unauthorized
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
