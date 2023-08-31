require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of users' do
      create_list(:user, 3) # Assuming you have a factory for User
      get :index
      users = JSON.parse(response.body)
      expect(users.length).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = create(:user) # Assuming you have a factory for User
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        user_params = attributes_for(:user)
        expect { post :create, params: { user: user_params } }.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect { post :create, params: { user: { name: nil } } }.not_to change(User, :count)
      end

      it 'returns unprocessable entity status' do
        post :create, params: { user: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { create(:user) }

    context 'with valid parameters' do
      it 'updates the user' do
        patch :update, params: { id: user.id, user: { name: 'Updated Name' } }
        user.reload
        expect(user.name).to eq('Updated Name')
      end

      it 'returns a successful response' do
        patch :update, params: { id: user.id, user: attributes_for(:user) }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the user' do
        patch :update, params: { id: user.id, user: { name: nil } }
        user.reload
        expect(user.name).not_to be_nil
      end

      it 'returns unprocessable entity status' do
        patch :update, params: { id: user.id, user: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the user' do
      user = create(:user)
      expect { delete :destroy, params: { id: user.id } }.to change(User, :count).by(-1)
    end

    it 'returns a successful response' do
      user = create(:user)
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
