require 'rails_helper'

RSpec.describe 'yelp requests' do 
    describe 'happy path' do 
        it 'will return the desired JSON', :vcr do 
            get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:attributes]).to include(:destination_city, :travel_time, :forecast, :restaraunt)
            expect(response_info[:data][:attributes][:forecast]).to include(:summary, :temperature)
            expect(response_info[:data][:attributes][:restaraunt]).to include(:name, :address)
            # Testing of specific values such as response_info[:data][:attributes][:forecast][:temperature].to eq(...) might yield failures due to vagaries in the weather
            # so specific testing beyond structure of response will be omitted. 
        end
    end
end