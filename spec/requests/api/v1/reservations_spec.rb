require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  describe 'GET /api/v1/reservations/{id}/item_details' do
    path '/api/v1/reservations/{id}/item_details' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      get('item_details reservation') do
        response(200, 'successful') do
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end
end

RSpec.describe 'api/v1/reservations', type: :request do
  describe 'GET /api/v1/reservations' do
    path '/api/v1/reservations' do
      get('list reservations') do
        response(200, 'successful') do
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end

      post('create reservation') do
        response(200, 'successful') do
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end

  describe 'GET /api/v1/reservations/{id}' do
    path '/api/v1/reservations/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      delete('delete reservation') do
        response(200, 'successful') do
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end
end

RSpec.describe 'api/v1/reservations', type: :request do
  describe 'GET /api/v1/users/{user_id}/reservations' do
    path '/api/v1/users/{user_id}/reservations' do
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

      get('list reservations') do
        response(200, 'successful') do
          let(:user_id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end

      post('create reservation') do
        response(200, 'successful') do
          let(:user_id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end

  describe 'GET /api/v1/users/{user_id}/reservations/{id}' do
    path '/api/v1/users/{user_id}/reservations/{id}' do
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
      parameter name: 'id', in: :path, type: :string, description: 'id'

      get('show reservation') do
        response(200, 'successful') do
          let(:user_id) { '123' }
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end

      patch('update reservation') do
        response(200, 'successful') do
          let(:user_id) { '123' }
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end
end

RSpec.describe 'api/v1/reservations', type: :request do
  describe 'GET /api/v1/items/{item_id}/reservations' do
    path '/api/v1/items/{item_id}/reservations' do
      parameter name: 'item_id', in: :path, type: :string, description: 'item_id'

      get('list reservations') do
        response(200, 'successful') do
          let(:item_id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end

      post('create reservation') do
        response(200, 'successful') do
          let(:item_id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end

  describe 'GET /api/v1/items/{item_id}/reservations/{id}' do
    path '/api/v1/items/{item_id}/reservations/{id}' do
      parameter name: 'item_id', in: :path, type: :string, description: 'item_id'
      parameter name: 'id', in: :path, type: :string, description: 'id'

      get('show reservation') do
        response(200, 'successful') do
          let(:item_id) { '123' }
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end

      patch('update reservation') do
        response(200, 'successful') do
          let(:item_id) { '123' }
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end
end