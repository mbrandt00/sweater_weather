class DailyWeather
    attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp,:conditions, :icon
    def initialize(data, time_zone)
        @time_zone = time_zone
        @date = format_date(data[:dt]).strftime("%F")
        
        @sunrise = format_date(data[:sunrise]).strftime("%H:%M")
        @sunset = format_date(data[:sunset]).strftime("%H:%M")
        @max_temp = data[:temp][:max]
        @min_temp  = data[:temp][:min]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end

    def format_date(raw_date)
        Time.at(raw_date).in_time_zone(@time_zone)
    end
end