class UnsplashService
    def self.conn
    Faraday.new(
        url: "https://api.unsplash.com/",
        params: {client_id: ENV['unsplash_access_key']},
        headers: {'Content-Type' => 'application/json'})
    end

    def self.search_photo(search)
        response = conn.get("search/photos") do |req|
            req.params['query'] = search
        end
        json = JSON.parse(response.body, symbolize_names: true)
    end

end