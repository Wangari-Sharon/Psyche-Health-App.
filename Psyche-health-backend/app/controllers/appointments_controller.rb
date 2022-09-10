class AppointmentsController < ApplicationController
    
    # get '/appointments/earliest' do
    #     Appointment.earliest.to_json
    # end

    # get '/appointments/latest' do
    #     Appointment.latest.to_json
    # end

    
    get '/appointments' do
        appointments = Appointment.all.order(:date).limit(50)
        
        appointments.to_json(
            only: [:date], 
            include: { therapist: { only: [:therapist_name] }, 
            client: { only: [:client_name] } 
        })
    end 

    # /appointments/:id => Retrieve an Individual Appointment via Params (:id)
    get '/appointments/:id' do
        Appointment.find(params[:id]).to_json
    end 
end 