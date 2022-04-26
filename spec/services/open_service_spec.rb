require 'rails_helper'

RSpec.describe OpenWeatherService do 
    it 'will return the weather', :vcr do 
        data = OpenWeatherService.all_weather(39.7392, 104.9903)
        expect(data).to include(:lat, :lon, :timezone, :current, :hourly, :daily)
    end
end