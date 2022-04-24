require './app/poros/roadtrip_weather'
class RoadTrip 
    attr_reader :start_city, :end_city, :temperature, :conditions, :id, :travel_time
    def initialize(data) 
        @id = nil
        @travel_time = Time.at(data[:time]).utc.strftime "%H hour(s) %M minute(s)"
        @end_lat = data[:locations].second[:latLng][:lat]
        @end_lng = data[:locations].second[:latLng][:lng]
        @start_city = data[:locations].first[:adminArea5]
        @end_city = data[:locations].second[:adminArea5]
        weather_at_eta = calculate_weather_at_eta(@end_lat, @end_lng, data[:time])
        @temperature = weather_at_eta.temperature
        @conditions = weather_at_eta.conditions
    end

    def calculate_weather_at_eta(lat, lon, seconds)
        RoadtripWeather.new(OpenWeatherFacade.all_weather(lat, lon), seconds)
    end
end