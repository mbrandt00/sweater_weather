require 'rails_helper'

RSpec.describe Restaraunt do 
    it 'will return a restaraunt object' do 
        data =  {name: 'Daves hot chicken', location: {address1: '101 E. 6th Ave', address2: 'suite 101', city: 'NY', state: 'NY', zip_code: 10003}}
        trip_info = {data: ['stubbed data']}
        restaraunt = Restaraunt.new(data, trip_info)
        expect(restaraunt).to be_a(Restaraunt)
        expect(restaraunt.address).to eq('101 E. 6th Ave, suite 101, NY, NY 10003')
        expect(restaraunt.trip_info).to eq({data: ['stubbed data']})
    end
end