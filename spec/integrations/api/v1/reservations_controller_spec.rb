require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) } # Assuming you have a factory for User

    it 'returns a successful response' do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of reservations for the user' do
      reservations = create_list(:reservation, 3, user: user) # Assuming you have a factory for Reservation
      get :index, params: { user_id: user.id }
      reservations_response = JSON.parse(response.body)
      expect(reservations_response.length).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      reservation = create(:reservation) # Assuming you have a factory for Reservation
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #item_details' do
    it 'returns a successful response' do
      reservation = create(:reservation) # Assuming you have a factory for Reservation
      get :item_details, params: { id: reservation.id }
      expect(response).to have_http_status(:success)
    end
    # Add more tests for the item_details action based on your use case
  end

  describe 'POST #create' do
    let(:user) { create(:user) } # Assuming you have a factory for User
    let(:item) { create(:item) } # Assuming you have a factory for Item

    context 'with valid parameters' do
      it 'creates a new reservation' do
        reservation_params = attributes_for(:reservation, user_id: user.id, item_id: item.id)
        expect { post :create, params: { user_id: user.id, item_id: item.id, date: '2023-09-01', city: 'Sample City' } }.to change(Reservation, :count).by(1)
      end

      # Add more tests for successful scenarios
    end

    context 'with invalid parameters' do
      it 'does not create a new reservation' do
        expect { post :create, params: { user_id: user.id, item_id: item.id, date: nil, city: nil } }.not_to change(Reservation, :count)
      end

      it 'returns unprocessable entity status' do
        post :create, params: { user_id: user.id, item_id: item.id, date: nil, city: nil }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:reservation) { create(:reservation) }

    context 'with valid parameters' do
      it 'updates the reservation' do
        patch :update, params: { id: reservation.id, reservation: { city: 'Updated City' } }
        reservation.reload
        expect(reservation.city).to eq('Updated City')
      end

      it 'returns a successful response' do
        patch :update, params: { id: reservation.id, reservation: attributes_for(:reservation) }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the reservation' do
        patch :update, params: { id: reservation.id, reservation: { city: nil } }
        reservation.reload
        expect(reservation.city).not_to be_nil
      end

      it 'returns unprocessable entity status' do
        patch :update, params: { id: reservation.id, reservation: { city: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the reservation and associated data' do
      reservation = create(:reservation)
      create(:item_reservation, reservation: reservation) # Assuming you have a factory for ItemReservation
      expect { delete :destroy, params: { id: reservation.id } }.to change(Reservation, :count).by(-1)
    end

    it 'returns a successful response' do
      reservation = create(:reservation)
      delete :destroy, params: { id: reservation.id }
      expect(response).to have_http_status(:success)
    end
  end
end
