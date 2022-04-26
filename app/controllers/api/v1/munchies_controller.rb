class Api::V1::MunchiesController < ApplicationController
    def index 
        trip_info = MapQuestFacade.directions(params[:start], params[:destination])
        food_info = YelpFacade.restaraunt(params[:destination], params[:food], trip_info)
        render json: MunchieSerializer.new(food_info)
    end
end

