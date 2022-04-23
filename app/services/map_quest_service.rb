class MapQuestService
    def self.conn
        Faraday.new(
            url: "http://www.mapquestapi.com/geocoding/v1/",
            params: {key: ENV['map_quest_key']},
            headers: {'Content-Type' => 'application/json'})
    end

    def self.city_location(location)
        response = conn.post("address") do |req|
            req.body = {location: location}.to_json
        end
        json = JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first[:latLng]
    end
end