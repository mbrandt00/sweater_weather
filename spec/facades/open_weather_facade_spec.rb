require 'rails_helper'

RSpec.describe OpenWeatherFacade do 
    it 'will return a weather object', :vcr do 
        data = OpenWeatherFacade.all_weather(39.742043, -104.991531)
        expect(data).to be_a(Weather)
        expect(data.current).to be_a(CurrentWeather)
        expect(data.hourly.first).to be_a(HourlyWeather)
        expect(data.daily.first).to be_a(DailyWeather)
    end
end