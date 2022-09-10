class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :client
      t.references :therapist
      t.date :date
    end
  end
end
