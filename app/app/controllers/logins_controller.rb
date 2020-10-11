class LoginsController < ApplicationController
  before_action :authorize_request, except: :sign_up

  def sign_up
    # render 'sign_up'
  end
end
