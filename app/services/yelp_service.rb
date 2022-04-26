class YelpService
    def self.conn
    Faraday.new(
        url: "https://api.yelp.com/v3/",
        headers: {'Content-Type' => 'application/json', Authorization: "Bearer #{ENV['yelp_key']}" })
    end

    def self.matching_restaraunt(city, food)
        response = conn.get("businesses/search") do |req|
            req.params['location'] = city
            req.params['term'] = food
        end
        return JSON.parse(response.body, symbolize_names: true)
    end
end