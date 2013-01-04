class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :user_id
      t.integer :organization_id
      t.integer :treatment_id
      t.datetime :appointment_date
      t.string :state, :default => "open"
      t.text :notes

      t.timestamps
    end
    add_index :appointments, :patient_id
    add_index :appointments, :user_id
    add_index :appointments, :organization_id
  end
end
