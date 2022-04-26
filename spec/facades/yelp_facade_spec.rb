require 'rails_helper'

RSpec.describe 'yelp facade' do 
    it 'will return a restaraunt object', :vcr do 
        data = {start: 'new york', destination: 'Boston MA'}
        trip_info = MapQuestFacade.directions(data[:start], data[:destination])
        facade_data = YelpFacade.restaraunt(data[:start], data[:destination], trip_info )
        expect(facade_data).to be_a(Restaraunt)
        expect(facade_data.address.class).to eq(String)
        expect(facade_data.id).to be nil
        expect(facade_data.name).to be_a(String)
        expect(facade_data.trip_info).to be_a(RoadTrip)
    end
end