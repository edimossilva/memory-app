# frozen_string_literal: true

class Memory < ApplicationRecord
  belongs_to :user

  validates :key, :value, presence: true
  validates :key, uniqueness: { case_sensitive: false }
end
