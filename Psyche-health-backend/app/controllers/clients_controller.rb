class ClientsController < ApplicationController

    #initiate fetch request targeting an API endpoint

    # Our API endpoint
    get '/clients' do
        clients = Client.all
        clients.to_json(only: [:client_name, :issue], include: :therapist)
    end

    get '/clients/:id' do
        client = Client.all.find(params[:id])
        client.to_json(include: :appointments)
    end
end