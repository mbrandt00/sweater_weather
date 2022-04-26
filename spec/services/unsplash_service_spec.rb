require 'rails_helper'

RSpec.describe UnsplashService do 
    it 'will return the necessary JSON attributes', :vcr do 
        data = UnsplashService.search_photo('apple')[:results].first
        expect(data).to include(:urls, :user )
    end
end