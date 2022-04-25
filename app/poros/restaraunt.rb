class Restaraunt 
    attr_reader :name, :address
    def initialize(data) 
        @name = data[:name]
        @address = cleaned_location(data[:location])
    end
    def cleaned_location(messy_location)
        "#{messy_location[:address1]}, #{messy_location[:address2]}, #{messy_location[:city]}, #{messy_location[:state]} #{messy_location[:zip_code]}"
    end
end