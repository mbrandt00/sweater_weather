require 'rails_helper'

RSpec.describe MapQuestFacade do 
    describe 'happy path' do 
        it 'will return a RoadTrip object if condtions are met', :vcr do 
            data = MapQuestFacade.directions('NYC', 'LA')
            expect(data).to be_a(RoadTrip)
            expect(data.conditions).to be_a(String)
            expect(data.end_state).to be_a(String)
            expect(data.id).to be nil
            expect(data.start_city).to be_a(String)
            expect(data.temperature).to be_a(Float)
            expect(data.travel_time).to be_a(String)
        end
    end
    describe 'sad path', :vcr do 
        it 'will return nil if the route is not possible' do 
            data = MapQuestFacade.directions('NYC', 'London UK')
            expect(data).to be nil
        end
    end
end