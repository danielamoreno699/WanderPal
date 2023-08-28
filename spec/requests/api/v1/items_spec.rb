require 'swagger_helper'

RSpec.describe 'api/v1/items', type: :request do
  describe 'GET /api/v1/items' do
    path '/api/v1/items' do
      get('list items') do
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

  describe 'POST /api/v1/items' do
    path '/api/v1/items' do
      post('create item') do
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

  describe 'GET /api/v1/items/{id}' do
    path '/api/v1/items/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      get('show item') do
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

  describe 'PATCH /api/v1/items/{id}' do
    path '/api/v1/items/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      patch('update item') do
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

  describe 'PUT /api/v1/items/{id}' do
    path '/api/v1/items/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      put('update item') do
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

  describe 'DELETE /api/v1/items/{id}' do
    path '/api/v1/items/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      delete('delete item') do
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
