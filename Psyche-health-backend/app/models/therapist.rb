class Therapist < ActiveRecord::Base
    belongs_to :county
    has_many :appointments
    has_many :clients, through: :appointments

    def returnNameAndAge
        "#{self.therapist_name}-#{self.years_of_experience}"
    end


    def print 
        puts "Name: #{self.therapist_name}"
        puts "Years_of_experience: #{self.years_of_experience}"
        puts "Gender: #{self.gender}"
        puts "Phone number #{self.phone}"
        self.therapist_name
    end 

    newValue = print()
end