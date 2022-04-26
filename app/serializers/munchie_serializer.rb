class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination_city do |object| 
    "#{object.trip_info.end_city}, #{object.trip_info.end_state}"
  end
  attributes :travel_time do |object|
    object.trip_info.travel_time
  end
  attributes :forecast do |object| 
    {
      summary: object.trip_info.conditions, 
      temperature: object.trip_info.temperature
    }
  end
  attributes :restaraunt do |object| 
    {
      name: object.name, 
      address: object.address
    }
  end
end
