require './app/poros/weather'
class OpenWeatherFacade
    def self.all_weather(lat, lon)
        Weather.new(OpenWeatherService.all_weather(lat, lon))
    end
end