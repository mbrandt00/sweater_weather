class YelpFacade
    def self.restaraunt(city, food, trip_info)
        restaraunts = YelpService.matching_restaraunt(city, food)
        Restaraunt.new(restaraunts[:businesses].first, trip_info)
    end
end