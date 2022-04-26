require 'rails_helper'

RSpec.describe UnsplashFacade do 
    it 'should make a photo', :vcr do 
        data = UnsplashFacade.search_photo('new york', 'rain')
        expect(data).to be_a(Photo)
        expect(data.image_url).to be_a(String)
        expect(data.photographer).to be_a(String)
        expect(data.source).to be_a(String)
        expect(data.unsplash_profile).to be_a(String)
    end
end