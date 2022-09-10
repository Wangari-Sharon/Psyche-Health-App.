class Appointment < ActiveRecord::Base
    belongs_to :client
    belongs_to :therapist

    def self.earliest
        self.all.pluck(:date).min
    end

    def self.latest
        self.all.pluck(:date).max
    end
end