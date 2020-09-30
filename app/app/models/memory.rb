class Memory < ApplicationRecord
  validates_presence_of :key, :value
  def to_s
  "#{key}, #{value}, #{visibility}"
  end
end
