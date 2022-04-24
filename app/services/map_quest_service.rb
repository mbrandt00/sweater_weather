class MapQuestService
    def self.conn
        Faraday.new(
            url: "http://www.mapquestapi.com/",
            params: {key: ENV['map_quest_key']},
            headers: {'Content-Type' => 'application/json'})
    end

    def self.city_location(location)
        response = conn.post("geocoding/v1/address") do |req|
            req.body = {location: location}.to_json
        end
        json = JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first[:latLng]
    end

    def self.directions(origin, destination)
        response = conn.get("directions/v2/route") do |req|
            req.params['from'] = origin 
            req.params['to'] = destination
        end
        return JSON.parse(response.body, symbolize_names: true)[:route]
    end
end