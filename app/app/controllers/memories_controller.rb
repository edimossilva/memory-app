# frozen_string_literal: true

class MemoriesController < ApplicationController
  before_action :authorize_request

  def create
    memory = Memory.create!(create_params)
    render_created(memory)
  end

  def destroy
    memory = Memory.find_by!(search_params)

    authorize memory, :owner?

    memory.destroy!

    render_destroyed
  end

  def index
    render_ok(Memory.where(user: current_user))
  end

  def show
    memory = Memory.find_by!(search_params)

    authorize memory, :owner?

    render_ok(memory)
  end

  def update
    memory = Memory.find_by!(search_params)

    authorize memory, :owner?

    memory.update!(update_params)

    render_ok(memory)
  end

  private

  def create_params
    params.permit(:key, :value, :visibility)
          .merge(user_id: current_user.id)
  end

  def update_params
    params.permit(:key, :value, :visibility)
  end
end
