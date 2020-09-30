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
end
