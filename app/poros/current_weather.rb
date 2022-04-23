class CurrentWeather
    attr_reader :date_time, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon
    def initialize(data, time_zone)
        @time_zone = time_zone
        @date_time = format_date(data[:dt]).strftime("%F")
        @sunrise = format_date(data[:sunrise]).strftime("%H:%M")
        @sunset = format_date(data[:sunset]).strftime("%H:%M")
        @temperature = data[:temp]
        @feels_like  = data[:feels_like]
        @humidity = data[:humidity]
        @uvi = data[:uvi]
        @visibility = data[:visibility]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end

    def format_date(raw_date)
        Time.at(raw_date).in_time_zone(@time_zone)
    end
end