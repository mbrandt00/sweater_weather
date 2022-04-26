require 'rails_helper'

RSpec.describe MapQuestService do 
    describe 'city_location' do 
        it 'will return the necessary attributes', :vcr do 
            data = MapQuestService.city_location('denver')
            expect(data).to eq({:lat=>39.738453, :lng=>-104.984853})
        end
    end
    describe 'directions' do 
        it 'will return the directions', :vcr do 
            data = MapQuestService.directions('denver co', 'puebo co')
            expect(data).to include(:locations, :time)
        end
    end
end