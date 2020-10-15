# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe '#login' do
    let!(:user) { create :user }

    context 'When receive matching username and password' do
      before { post '/auth/login', params: { username: user.username, password: user.password } }

      it { expect(response).to have_http_status(:ok) }

      it "responds with user's username" do
        json_response = JSON.parse(response.body)
        expect(json_response['username']).to eq(user.username)
      end

      it "responds with user's access_level" do
        json_response = JSON.parse(response.body)
        expect(json_response['accessLevel']).to eq(user.access_level)
      end

      it 'responds with a token related to the user id' do
        json_response = JSON.parse(response.body)
        payload = decode_token(json_response['token'])

        expect(payload[:user_id]).to eq(user.id)
      end
    end

    context 'When receive NOT matching username and password' do
      context 'when invalid username and password' do
        before { post '/auth/login', params: { username: 'invalid username', password: 'invalid passowrd' } }

        it { expect(response).to have_http_status(:unauthorized) }
      end

      context 'when valid username and invalid password' do
        before { post '/auth/login', params: { username: user.username, password: 'invalid passowrd' } }

        it { expect(response).to have_http_status(:unauthorized) }
      end

      context 'when invalid username and valid password' do
        before { post '/auth/login', params: { username: 'invalid username', password: user.password } }

        it { expect(response).to have_http_status(:unauthorized) }
      end
    end
  end

  describe '#sign_up' do
    subject { get '/auth/sign_up' }

    it "redirects to google_oauth2" do
      expect(subject).to redirect_to('/auth/google_oauth2')
    end
  end

  describe '#check' do
    describe 'Whhen user is authorized' do
      let!(:registred_user) { create(:user, :registred) }
      let!(:registred_headers) { header_for_user(registred_user) }

      before { get '/auth/check', headers:registred_headers }

      it { expect(response).to have_http_status(:ok) }

      it "responds with user token and data" do
        json_response = JSON.parse(response.body)
        payload = decode_token(json_response['token'])
        expect(json_response['username']).to eq(registred_user.username)
        expect(json_response['accessLevel']).to eq(registred_user.access_level)
        expect(json_response['userId']).to eq(registred_user.id)
      end
    end

    describe 'Whhen user is unauthorized' do
      before { get '/auth/check' }

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
