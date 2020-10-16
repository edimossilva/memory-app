# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Memory', type: :request do
  let!(:registred_user) { create(:user, :registred) }
  let!(:registred_headers) { header_for_user(registred_user) }
  let!(:user2) { create(:user) }
  let!(:registred_headers2) { header_for_user(user2) }

  context '#create' do
    context 'when data is valid' do
      let!(:create_memory_params) do
        {
          key: 'phone',
          value: '88123456789',
          visibility: true
        }
      end

      before(:each) do
        post('/memories', params: create_memory_params, headers: registred_headers)
      end

      it { expect(response).to have_http_status(:created) }

      it 'contains fields from params' do
        expect(json_response_data['id']).not_to be_nil
        expect(json_response_data['key']).to eq(create_memory_params[:key])
        expect(json_response_data['value']).to eq(create_memory_params[:value])
        expect(json_response_data['visibility']).to eq(create_memory_params[:visibility])
      end
    end

    context 'when data is not valid' do
      let!(:create_memory_params) do
        {
          key: '',
          value: '',
          visibility: ''
        }
      end

      before(:each) do
        post('/memories', params: create_memory_params, headers: registred_headers)
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }

      it 'contains fields from params' do
        expect(json_response_error).to eq("Validation failed: Key can't be blank, Value can't be blank")
      end
    end
  end

  context '#destroy' do
    let!(:memory) { create(:memory, user: registred_user) }

    describe 'When find memory' do
      before(:each) do
        delete("/memories/#{memory.id}", headers: registred_headers)
      end

      it { expect(response).to have_http_status(:no_content) }
    end

    describe 'When not find memory' do
      before(:each) do
        delete('/memories/999', headers: registred_headers)
      end

      it { expect(response).to have_http_status(:not_found) }

      it 'return error message related to not found' do
        expect(json_response_error).to eq("Couldn't find Memory")
      end
    end

    describe 'When is not owner' do
      before(:each) do
        delete("/memories/#{memory.id}", headers: registred_headers2)
      end

      it { expect(response).to have_http_status(:unauthorized) }
      it { expect(memory.reload).to_not be_nil }
    end
  end

  context '#find' do
    let!(:memory) { create(:memory, user: registred_user, key: 'key', value: 'value', visibility: 'false') }

    describe 'When data is valid' do
      before(:each) do
        get("/memories/#{memory.id}", headers: registred_headers)
      end

      it { expect(response).to have_http_status(:ok) }

      it 'returns memory' do
        expect(json_response_data['id']).to eq(memory.id)
      end
    end

    describe 'When not find item' do
      before(:each) do
        put('/memories/999', headers: registred_headers)
      end

      it { expect(response).to have_http_status(:not_found) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("Couldn't find Memory")
      end
    end

    describe 'When memory not belongs to user' do
      before(:each) do
        put("/memories/#{memory.id}", headers: registred_headers2)
      end

      it { expect(response).to have_http_status(:unauthorized) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("not allowed to owner? this Memory")
      end
    end
  end

  context '#index' do
    before(:each) do
      create_list(:memory, 3)
      create_list(:memory, 2, user: registred_user)
      get('/memories', headers: registred_headers)
    end

    it { expect(response).to have_http_status(:ok) }

    it 'contains all user memories' do
      expect(json_response_data.count).to eq(2)
    end
  end

  context '#update' do
    let!(:memory) { create(:memory, user: registred_user, key: 'key', value: 'value', visibility: 'false') }

    describe 'When data is valid' do
      let!(:update_memory_params) do
        {
          'key' => 'new_key',
          'value' => 'new_value',
          'visibility' => 'true'
        }
      end

      before(:each) do
        put("/memories/#{memory.id}", params: update_memory_params, headers: registred_headers)
      end

      it { expect(response).to have_http_status(:ok) }

      it 'updates fields' do
        expect(json_response_data['key']).to eq('new_key')
        expect(json_response_data['value']).to eq('new_value')
        expect(json_response_data['visibility']).to eq(true)
      end
    end

    describe 'When data is invalid' do
      let!(:update_memory_params) do
        {
          'key' => 'new_key',
          'value' => '',
          'visibility' => 'true'
        }
      end

      before(:each) do
        put("/memories/#{memory.id}", params: update_memory_params, headers: registred_headers)
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("Validation failed: Value can't be blank")
      end
    end

    describe 'When not find item' do
      before(:each) do
        put('/memories/999', headers: registred_headers)
      end

      it { expect(response).to have_http_status(:not_found) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("Couldn't find Memory")
      end
    end

    describe 'When memory not belongs to user' do
      before(:each) do
        put("/memories/#{memory.id}", headers: registred_headers2)
      end

      it { expect(response).to have_http_status(:unauthorized) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("not allowed to owner? this Memory")
      end
    end
  end
end
