require 'rails_helper'

RSpec.describe 'road trip requests' do 
    describe 'happy path' do 
        it 'will have all of the required attributes', :vcr do 
            post "/api/v1/road_trip", params: {"origin": "Boston,MA","destination": "Newport,OR", "api_key": "jgn983hy48thw9begh98h4539h4"}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:attributes]).to include(:start_city, :end_city, :travel_time, :weather_at_eta)
        end
        it 'will have the travel time', :vcr do 
            post "/api/v1/road_trip", params: {"origin": "Boston,MA","destination": "Newport,OR", "api_key": "jgn983hy48thw9begh98h4539h4"}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:attributes][:travel_time]).to eq('22 hour(s) 44 minute(s)')
        end
        it 'will have the weather & conditions at eta', :vcr do
            post "/api/v1/road_trip", params: {"origin": "Boston,MA","destination": "Newport,OR", "api_key": "jgn983hy48thw9begh98h4539h4"}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:attributes][:weather_at_eta][:temperature]).to eq(52.2)
            expect(response_info[:data][:attributes][:weather_at_eta][:conditions]).to eq('overcast clouds')
        end
    end
    describe 'sad path' do 
        it 'will return if the trip is impossible', :vcr do 
            post "/api/v1/road_trip", params: {"origin": "Boston,MA","destination": "London,UK", "api_key": "jgn983hy48thw9begh98h4539h4"}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:error]).to eq('impossible')
        end
        it 'will return unauthorized if no api key is passed', :vcr do 
            post "/api/v1/road_trip", params: {"origin": "Boston,MA","destination": "Middletown,CT"}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:status]).to eq('unauthorized')
        end
    end
end