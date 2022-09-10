class CreateTherapists < ActiveRecord::Migration[6.1]
  def change
    create_table :therapists do |t|
      t.string :therapist_name
      t.integer :years_of_experience
      t.string :gender
      t.string :phone
      t.boolean :active
      t.integer :county_id
      t.timestamps
    end
  end
end
