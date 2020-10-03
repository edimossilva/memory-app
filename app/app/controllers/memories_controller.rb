# frozen_string_literal: true

class MemoriesController < ApplicationController
  before_action :authorize_request, except: %i[create destroy index update]

  def create
    memory = Memory.create!(create_params)
    render_created(memory)
  end

  def destroy
    memory = Memory.find_by!(search_params)
    memory.destroy!

    render_destroyed
  end

  def index
    render_ok(Memory.all)
  end

  def update
    memory = Memory.find_by!(search_params)
    memory.update!(update_params)

    render_ok(memory)
  end

  private

  def create_params
    params.permit(:key, :value, :visibility)
  end

  def update_params
    params.permit(:key, :value, :visibility)
  end
end
