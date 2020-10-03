# frozen_string_literal: true

class Memory < ApplicationRecord
  validates :key, :value, presence: true
  validates :key, uniqueness: { case_sensitive: false }
end
