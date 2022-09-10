class County < ActiveRecord::Base
    has_many :therapists, dependent: :destroy      
end