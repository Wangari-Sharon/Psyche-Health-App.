class CountiesController < ApplicationController
    get '/counties' do

        County.all.to_json

        # county = County.all
        # # counties.to_json(include: :clients)
        # counties.to_json(
        #     only: [:county_name], 
        #     include: { clients: 
        #         { only: [:client_name, :gender] }
        # }) 
    end

    get '/counties/:id' do
        county = County.find(params[:id])
        county.to_json(include: :clients)
    end
end