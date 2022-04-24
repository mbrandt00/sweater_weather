require './app/poros/road_trip'
class MapQuestFacade
    def self.directions(origin, destination)
        info = MapQuestService.directions(origin, destination)
        if info[:routeError][:errorCode]==2
            return nil
        else 
            RoadTrip.new(info)
        end
    end
end