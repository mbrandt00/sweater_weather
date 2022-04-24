class RoadtripWeather
    attr_reader :temperature, :conditions
    def initialize(data, time)
        @hours = time/3600
        @temperature = data.hourly[@hours].temperature
        @conditions = data.hourly[@hours].conditions
    end
end