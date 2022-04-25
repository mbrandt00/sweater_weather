require 'rails_helper'

RSpec.describe 'yelp requests' do 
    describe 'happy path' do 
        it 'will return food information for the destination of a roadtrip', :vcr do 
            get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
        end
    end
end