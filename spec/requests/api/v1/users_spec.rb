require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    describe 'GET' do
      get('list users') do
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

    describe 'POST' do
      post('create user') do
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

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    describe 'GET' do
      get('show user') do
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
  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    describe 'PATCH' do
      patch('update user') do
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
  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    describe 'PUT' do
      put('update user') do
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
  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    describe 'DELETE' do
      delete('delete user') do
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
