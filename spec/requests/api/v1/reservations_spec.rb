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

      describe 'GET' do
        get('show reservation') do
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
    describe 'GET /api/v1/reservations/{id}' do
      describe 'PATCH' do
        patch('update reservation') do
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
    describe 'GET /api/v1/reservations/{id}' do
      describe 'PUT' do
        put('update reservation') do
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

    describe 'GET /api/v1/reservations/{id}' do
      describe 'DELETE' do
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
end
