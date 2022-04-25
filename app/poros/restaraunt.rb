class Restaraunt 
    attr_reader :name, :address, :trip_info, :id
    def initialize(data, trip_info) 
        @id = nil
        @name = data[:name]
        @address = cleaned_location(data[:location])
        @trip_info = trip_info
    end
    
    def cleaned_location(messy_location)
        "#{messy_location[:address1]}, #{messy_location[:address2]}, #{messy_location[:city]}, #{messy_location[:state]} #{messy_location[:zip_code]}"
    end
end