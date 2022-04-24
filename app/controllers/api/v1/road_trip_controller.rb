class Api::V1::RoadTripController < ApplicationController
    def create 
        if params[:origin] && params[:destination] && params[:api_key]
            trip_info = MapQuestFacade.directions(params[:origin], params[:destination])
            if trip_info.nil? 
                render json: {error: 'impossible'}
            else 
                render json: RoadtripSerializer.new(trip_info)
            end
        else 
            render json: {status: :unauthorized}
        end
    end
end