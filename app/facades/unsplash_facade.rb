require './app/poros/photo'
class UnsplashFacade
    def self.search_photo(location, conditions)
        location.sub!(',', ', ')
        search_with_condition = "#{location} #{conditions} "
        Photo.new(UnsplashService.search_photo(search_with_condition)[:results].first)
    end
end