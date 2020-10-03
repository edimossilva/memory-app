# frozen_string_literal: true

class Memory < ApplicationRecord
  validates_presence_of :key, :value
  validates_uniqueness_of :key, case_sensitive: false
end
