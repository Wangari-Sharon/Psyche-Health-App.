class  Client < ActiveRecord::Base
    has_many :appointments, dependent: :destroy
    has_many :therapists, through: :appointments
end