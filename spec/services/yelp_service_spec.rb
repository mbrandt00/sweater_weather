require 'rails_helper'

RSpec.describe 'yelp service' do 
    it 'will return name and address', :vcr do 
        data = YelpService.matching_restaraunt('NYC', 'chinese')
        expect(data[:businesses].first).to include(:name, :location)
    end
end