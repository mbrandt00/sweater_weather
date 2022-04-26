require 'rails_helper'

RSpec.describe User do 
    it 'will add an api key after creation' do 
        user = User.create!(email: 'test@yahoo.com', password: 'password')
        expect(user.apikey).to be_a(String)
        expect(user.apikey.length).to eq(54)
    end
end