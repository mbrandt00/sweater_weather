class Api::V1::ForecastController < ApplicationController
    def show 
    end
    def index 
        coordinates = MapQuestService.city_location(params[:location])
        forecasts = OpenWeatherFacade.all_weather(coordinates[:lat], coordinates[:lng])
        render json: ForecastSerializer.new(forecasts)
    end
end