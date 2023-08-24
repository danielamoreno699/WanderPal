require 'rails_helper'

RSpec.describe 'Api::V1::ReservationsController', type: :request do
  describe 'GET /api/v1/reservations' do
    it 'returns a list of reservations' do
      create_list(:reservation, 3)
      get '/api/v1/reservations'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET /api/v1/reservations/:id' do
    it 'returns a single reservation' do
      reservation = create(:reservation)
      get "/api/v1/reservations/#{reservation.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(reservation.id)
    end
  end

  describe 'POST /api/v1/reservations' do
    it 'creates a new reservation' do
      user = create(:user)
      reservation_params = attributes_for(:reservation, user_id: user.id)
      post '/api/v1/reservations', params: { reservation: reservation_params }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH /api/v1/reservations/:id' do
    it 'updates an existing reservation' do
      reservation = create(:reservation)
      updated_city = 'New City'
      patch "/api/v1/reservations/#{reservation.id}", params: { reservation: { city: updated_city } }
      expect(response).to have_http_status(:ok)
      expect(reservation.reload.city).to eq(updated_city)
    end
  end

  describe 'DELETE /api/v1/reservations/:id' do
    it 'deletes a reservation' do
      reservation = create(:reservation)
      delete "/api/v1/reservations/#{reservation.id}"
      expect(response).to have_http_status(:no_content)
      expect { reservation.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
