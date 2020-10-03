# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Memory, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:key) }
    it { should validate_presence_of(:value) }
    it { should validate_uniqueness_of(:key).case_insensitive }
  end
end
