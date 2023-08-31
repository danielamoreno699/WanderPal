require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of items' do
      create_list(:item, 3)
      get :index
      items = JSON.parse(response.body)
      expect(items.length).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      item = create(:item)
      get :show, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let!(:user) { create(:user) }

      it 'creates a new item' do
        item_params = attributes_for(:item, user_id: user.id)
        expect { post :create, params: { item: item_params } }.to change(Item, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new item' do
        expect { post :create, params: { item: { name: nil } } }.not_to change(Item, :count)
      end

      it 'returns unprocessable entity status' do
        post :create, params: { item: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:item) { create(:item) }

    context 'with valid parameters' do
      it 'updates the item' do
        patch :update, params: { id: item.id, item: { name: 'Updated Name' } }
        item.reload
        expect(item.name).to eq('Updated Name')
      end

      it 'returns a successful response' do
        patch :update, params: { id: item.id, item: attributes_for(:item) }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the item' do
        patch :update, params: { id: item.id, item: { name: nil } }
        item.reload
        expect(item.name).not_to be_nil
      end

      it 'returns unprocessable entity status' do
        patch :update, params: { id: item.id, item: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the item' do
      item = create(:item)
      expect { delete :destroy, params: { id: item.id } }.to change(Item, :count).by(-1)
    end

    it 'returns a successful response' do
      item = create(:item)
      delete :destroy, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end
end
