require 'rails_helper'

RSpec.describe 'Api::V1::ItemsController', type: :request do
  describe 'GET /api/v1/items' do
    it 'returns a list of items' do
      create_list(:item, 3) 
      get '/api/v1/items'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET /api/v1/items/:id' do
    it 'returns a single item' do
      item = create(:item) 
      get "/api/v1/items/#{item.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(item.id)
    end
  end

  describe 'POST /api/v1/items' do
    it 'creates a new item' do
      user = create(:user) 
      item_params = attributes_for(:item, user_id: user.id)
      post '/api/v1/items', params: { item: item_params }
      expect(response).to have_http_status(:created), response.body
    end
  end

  describe 'PATCH /api/v1/items/:id' do
    it 'updates an existing item' do
      item = create(:item) 
      updated_name = 'Updated Item Name'
      patch "/api/v1/items/#{item.id}", params: { item: { name: updated_name } }
      expect(response).to have_http_status(:ok)
      expect(item.reload.name).to eq(updated_name)
    end
  end

  describe 'DELETE /api/v1/items/:id' do
    it 'deletes an item' do
      item = create(:item) 
      delete "/api/v1/items/#{item.id}"
      expect(response).to have_http_status(:no_content)
      expect { item.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
