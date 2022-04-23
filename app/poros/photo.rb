class Photo 
    attr_reader :source, :image_url, :photographer, :unsplash_profile, :id
    def initialize(data) 
        @id = nil
        @source = 'unsplash.com'
        @image_url = data[:urls][:full]
        @photographer = data[:user][:username]
        @unsplash_profile = data[:user][:links][:html]+ "?utm_source=sweater_weather&utm_medium=referral"
    end
end