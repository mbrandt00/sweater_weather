class OpenWeatherService
    def self.conn
        Faraday.new(
            url: "https://api.openweathermap.org/data/2.5/",
            params: {appid: ENV['open_weather_key']})
    end

    def self.all_weather(lat, lon)
        response = conn.get("onecall") do |req|
            req.params['lat'] = lat
            req.params['units'] = 'imperial'
            req.params['lon'] = lon
            req.params['exclude'] = 'minutely,alerts'
        end
        json = JSON.parse(response.body, symbolize_names: true)
    end    
end