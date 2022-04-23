require 'rails_helper'

RSpec.describe 'user registration' do 
    describe 'happy path' do
        it 'will make a new user in the database' do 
            expect(User.count).to eq(0)
            params = { email: 'whatever@example.com',  
                password: 'password', 
                password_confirmation: 'password'}
            post "/api/v1/users", params: params
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(User.count).to eq(1)
            expect(response_info[:data][:attributes]).to include(:email, :api_key)
            expect(response_info[:data][:type]).to eq("users")
        end
    end 
    describe 'sad path' do 
        it 'will return an error if the password does not match' do 
            params = { email: 'whatever@example.com',  
                password: 'password5', 
                password_confirmation: 'password'}
            post "/api/v1/users", params: params
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:status]).to eq(400)
            expect(response_info[:error]).to eq('passwords do not match')
        end
        it 'will return an error if email is taken' do 
            User.create!(email: 'whatever@example.com', password: 'password')
            params = { email: 'whatever@example.com',  
                password: 'password', 
                password_confirmation: 'password'}
            post "/api/v1/users", params: params
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:status]).to eq(400)
            expect(response_info[:error]).to eq('email taken')
        end
    end

end