require 'rails_helper'

RSpec.describe 'image requests', :vcr do 
    it 'will return an image based on the query param' do 
        #request 
        get "/api/v1/backgrounds?location=denver,co"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data][:attributes]).to include(:image_url, :photographer, :source, :unsplash_profile)
    end
end