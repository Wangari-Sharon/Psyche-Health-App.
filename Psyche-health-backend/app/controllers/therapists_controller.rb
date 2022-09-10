class TherapistsController < ApplicationController

    #initiate fetch request targeting an API endpoint

    # Our API endpoint
    get '/therapists' do
        # Therapist.all.to_json
        therapists = Therapist.all.order(:therapist_name)
        # #demand is sent to therapist model
        # therapist.to_json(only: [:therapist_name, :years of experience], include: :county)
        therapists.to_json(include: :county)
    end

    #Retrieve individual therapist via param (:id)
    get '/therapists/:id' do
        Therapist.find(params[:id]).to_json(include: :appointments)
    end

    post "/therapists" do
        therapist = Therapist.create({therapist_name:params[:name],
            years_of_experience:params[:years_of_experience], gender:params[:gender],
            phone: params[:phone], active:params[:active], 
            county_id: params[:county_id]}
        )
            therapist.to_json(include: :county)
    end

    patch "/therapists/:id" do
        therapist = Therapist.find(params[:id])
        therapist.update({therapist_name:params[:name],
            years_of_experience: params[:years_of_experience], gender:params[:gender],
            phone:params[:phone], active:params[:active], 
            county_id: params[:county_id]}
        )
            therapist.to_json(include: :county)
    end

    delete "/therapists/:id" do
        therapist = Therapist.find(params[:id])
        therapist.destroy
        {message: 'therapist deleted from our database'}.to_json
    end
end