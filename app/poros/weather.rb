require './app/poros/current_weather'
require './app/poros/daily_weather'
require './app/poros/hourly_weather'
class Weather
    attr_reader :current, :daily, :hourly, :id, :time_zone
    def initialize(data)
        @time_zone =  data[:timezone]
        id = nil
        @current = CurrentWeather.new(data[:current], @time_zone)
        @daily = data[:daily].first(5).map {|day| 
            DailyWeather.new(day, @time_zone)}
        @hourly = data[:hourly].map {|hour|
            HourlyWeather.new(hour, @time_zone)}
    end
end