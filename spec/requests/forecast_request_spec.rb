require 'rails_helper'

RSpec.describe 'forecast requests' do 
    describe 'it will retrieve weather for a city' do 
        it 'will return lat and long of a city' do 
            result = MapQuestService.city_location('Denver,Co')
            expect(result[:lat]).to eq(39.738453)
            expect(result[:lng]).to eq(-104.984853)
        end
        it 'will return the current weather for a city from lat and lon' do 
            get "/api/v1/forecast?location=denver,co"
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:type]).to eq('forecast')
            expect(response_info[:data][:attributes]).to include(:daily_weather, :hourly_weather, :current_weather)
            expect(response_info[:data][:attributes][:current_weather]).to include(:date_time, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon)
            expect(response_info[:data][:attributes][:daily_weather].first).to include(:time_zone, :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)
            expect(response_info[:data][:attributes][:hourly_weather].first).to include(:time_zone, :time, :temperature, :conditions, :icon)
        end
    end
end