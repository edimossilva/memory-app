class Memory < ApplicationRecord
  validates_presence_of :key, :value
end
