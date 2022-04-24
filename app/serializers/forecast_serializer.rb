class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id 
  attributes :current_weather do |object| 
    {
      date_time: object.current.date_time, 
      sunrise: object.current.sunrise,
      sunset: object.current.sunset,
      temperature: object.current.temperature, 
      feels_like: object.current.feels_like, 
      humidity: object.current.humidity, 
      uvi: object.current.uvi, 
      visibility: object.current.visibility, 
      conditions: object.current.conditions, 
      icon: object.current.icon
    }
  end
  attributes :daily_weather do |object| 
    object.daily.each do |day|
    {
      date: object.daily.first.date,
      sunrise: day.sunrise,
      sunset: day.sunset,
      max_temp: day.max_temp, 
      min_temp: day.min_temp, 
      conditions: day.conditions, 
      icon: day.icon
    }
    end
  end
  attributes :hourly_weather do |object| 
    object.hourly.first(8).each do |hour| 
      {
        time: hour.time, 
        conditions: hour.conditions, 
        icon: hour.icon, 
        temperature: hour.temperature
      }
    end
  end
end
