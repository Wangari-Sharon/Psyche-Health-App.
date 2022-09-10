puts "🌱 Seeding spices..."

#Create Counties

s1 = County.create({county_name:'Nakuru', county_code:'032', phone: '+254-456-7890'})
s2 = County.create({county_name:'Nairobi', county_code:'047', phone: '+254-444-6666'})
s3 = County.create({county_name:'Kisumu', county_code:'042', phone: '+254-718-8923'})
s4 = County.create({county_name:'Mombasa', county_code:'001', phone: '+254-718-8923'})
s5 = County.create({county_name:'Machakos', county_code:'016', phone: '+254-731-8923'})



# Create Clients
problem = ['addiction']
gender = ['male', 'female']
5.times {Client.create(client_name:Faker::Name.name, problem:problem.sample)}


# Create Therapists
5.times {
    Therapist.create(
        gender:gender.sample, 
        therapist_name:Faker::Name.first_name , 
        years_of_experience:rand(1..45), 
        phone:Faker::PhoneNumber.cell_phone , 
        active:true, 
        county_id:County.all.sample.id
)}

# Create Appointments
5.times {
    Appointment.create(
        client_id:Client.all.sample.id, 
        therapist_id:Therapist.all.sample.id, 
        date:Faker::Date.between(from: 5.days.ago, to: Date.today)
)}

puts "✅ Done seeding!"







