# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  context '#omniauth' do
    let(:user) { build(:user) }
    before(:each) do
      allow(User).to receive(:from_omniauth).and_return(user)
      get '/auth/google/callback'
    end

    it 'contains fields from params' do
      response_json = JSON.parse(response.body)
      expect(response_json['token']).to_not be_nil
      expect(response_json['userId']).to_not be_nil
      expect(response_json['accessLevel']).to eq('registred')
      expect(response_json['username']).to eq(user.username)
    end
  end
end
