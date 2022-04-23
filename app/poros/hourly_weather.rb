class HourlyWeather
    attr_reader :time, :temperature, :conditions, :icon
    def initialize(data, time_zone)
        @time_zone = time_zone
        @time = format_time(data[:dt])
        @temperature = data[:temp]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end

    def format_time(raw_time)
        Time.at(raw_time).in_time_zone(@time_zone).strftime("%H:%M")
    end
end