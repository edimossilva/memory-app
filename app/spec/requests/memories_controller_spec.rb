require 'rails_helper'

RSpec.describe 'Memory', type: :request do
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
        post('/memories', params: create_memory_params)
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
        post('/memories', params: create_memory_params)
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }

      it 'contains fields from params' do
        expect(json_response_error).to eq("Validation failed: Key can't be blank, Value can't be blank")
      end
    end
  end

  context '#destroy' do
    let!(:memory) { create(:memory) }

    describe 'When find memory' do
      before(:each) do
        delete("/memories/#{memory.id}")
      end

      it { expect(response).to have_http_status(:no_content) }
    end

    describe 'When not find memory' do
      before(:each) do
        delete('/memories/999')
      end

      it { expect(response).to have_http_status(:not_found) }

      it 'return error message related to not found' do
        expect(json_response_error).to eq("Couldn't find Memory")
      end
    end
  end

  context '#index' do
    before(:each) do
      create_list(:memory, 3)
      get('/memories')
    end

    it { expect(response).to have_http_status(:ok) }

    it 'contains all items' do
      expect(json_response_data.count).to eq(3)
    end
  end

  context '#update' do
    let!(:memory) { create(:memory, key: 'key', value: 'value', visibility: 'false') }

    describe 'When data is valid' do
      let!(:update_memory_params) do
        {
          'key' => 'new_key',
          'value' => 'new_value',
          'visibility' => 'true'
        }
      end

      before(:each) do
        put("/memories/#{memory.id}", params: update_memory_params)
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
        put("/memories/#{memory.id}", params: update_memory_params)
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("Validation failed: Value can't be blank")
      end
    end

    describe 'When not find item' do
      before(:each) do
        put('/memories/999')
      end

      it { expect(response).to have_http_status(:not_found) }

      it 'return error message related to value' do
        expect(json_response_error).to eq("Couldn't find Memory")
      end
    end
  end
end
