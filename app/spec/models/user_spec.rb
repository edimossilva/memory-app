# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:memories).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(3) }
  end

  describe 'from_omniauth' do
    let(:auth) { double("auth") }
    let(:auth_info) { double("auth_info") }
    let(:email) { 'email@email.com' }

    before(:each) do
      allow(auth).to receive(:info).and_return(auth_info)
      allow(auth_info).to receive(:email).and_return(email)
    end

    describe 'When user exists' do
      let!(:user) { create(:user, username: email) }

      it 'return existing user' do
        omni_user = User.from_omniauth(auth)
        expect(omni_user).to eq(user)
      end
    end

    describe 'When user not exist' do
      it 'return existing user' do
        omni_user = User.from_omniauth(auth)
        expect(omni_user.id).to be_nil
      end
    end
  end
end
