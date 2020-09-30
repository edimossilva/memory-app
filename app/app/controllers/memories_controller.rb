# frozen_string_literal: true

class MemoriesController < ApplicationController
  before_action :authorize_request, except: :create

  def create
    memory = Memory.create!(create_params)
    render_created(memory)
  end

  private

  def create_params
    params.permit(:key, :value, :visibility)
  end
end
