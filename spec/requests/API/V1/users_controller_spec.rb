require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :request do
  describe 'GET /api/v1/users' do
    it 'returns a list of users' do
      create_list(:user, 3) # Assuming you're using FactoryBot for user creation
      get '/api/v1/users'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET /api/v1/users/:id' do
    it 'returns a single user' do
      user = create(:user) # Assuming you're using FactoryBot for user creation
      get "/api/v1/users/#{user.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end

  describe 'POST /api/v1/users' do
    it 'creates a new user' do
      user_params = attributes_for(:user) # Assuming you're using FactoryBot for user attributes
      post '/api/v1/users', params: { user: user_params }
      expect(response).to have_http_status(:created)
      # ...
    end
  end

  describe 'PATCH /api/v1/users/:id' do
    it 'updates an existing user' do
      user = create(:user) # Assuming you're using FactoryBot for user creation
      updated_name = 'New Name'
      patch "/api/v1/users/#{user.id}", params: { user: { name: updated_name } }
      expect(response).to have_http_status(:ok)
      expect(user.reload.name).to eq(updated_name)
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    it 'deletes a user' do
      user = create(:user) # Assuming you're using FactoryBot for user creation
      delete "/api/v1/users/#{user.id}"
      expect(response).to have_http_status(:no_content)
      expect { user.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
