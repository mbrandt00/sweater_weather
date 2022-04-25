class Api::V1::MunchiesController < ApplicationController
    def index 
        trip_info = MapQuestFacade.directions(params[:start], params[:destination])
        food_info = YelpFacade.restaraunt(params[:destination], params[:food])
        binding.pry
    end
end

