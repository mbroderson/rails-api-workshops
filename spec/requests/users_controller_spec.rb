require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'POST /users' do

    context 'with valid params' do
      it 'respond with status 200' do
        post '/users', params: { name: 'Zdzisiek' }
        expect(response.status).to eq(200)
      end

      it 'should create user' do
        post '/users', params: { name: 'Zdzisiek' }
        expect(User.count).to eq(1)
      end

      it 'should assign name to user' do
        post '/users', params: { name: 'Zdzisiek' }
        expect(User.last.name).to eq('Zdzisiek')
      end

      it 'should return user object' do
        post '/users', params: { name: 'Zdzisiek' }
        expect(JSON.parse(response.body)).to eq({"name"=>"Zdzisiek"})
      end
    end

    context 'with params invalid' do

      it 'should return status 422' do
        post '/users', params: {}
        expect(response.status).to eq(422)
      end
    end

  end
end
