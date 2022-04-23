class Api::V1::UsersController < ApplicationController
    def create 
        if params[:password] == params[:password_confirmation] && User.find_by_email(params[:email]).nil?
            User.create!(email: params[:email], password: params[:password])
            render json: UsersSerializer.new(User.last)
        elsif params[:password] != params[:password_confirmation]
            render json: {error: 'passwords do not match', status: 400}
        elsif User.find_by_email(params[:email])
            render json: {error: 'email taken', status: 400}
        end
    end
end