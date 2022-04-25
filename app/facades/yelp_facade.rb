class YelpFacade
    def self.restaraunt(city, food)
        restaraunts = YelpService.matching_restaraunt(city, food)
        Restaraunt.new(restaraunts[:businesses].first)
    end
end