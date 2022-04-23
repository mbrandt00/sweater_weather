class Api::V1::BackgroundsController < ApplicationController
    def index 
        coordinates = MapQuestService.city_location(params[:location])
        forecasts = OpenWeatherFacade.all_weather(coordinates[:lat], coordinates[:lng])
        photo = UnsplashFacade.search_photo(params[:location], forecasts.current.conditions)
        render json: ImageSerializer.new(photo)
    end
end