# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Memory, type: :model do
  describe 'relationshipd' do
    it { should belong_to(:user).required }
  end

  describe 'validations' do
    it { should validate_presence_of(:key) }
    it { should validate_presence_of(:value) }

    describe 'uniqueness' do
      subject { create(:memory) }
      it { should validate_uniqueness_of(:key).case_insensitive }
    end
  end
end
