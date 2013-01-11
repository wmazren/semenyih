class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :physician_id
      t.date :appointment_date
      t.integer :organization_id
      t.string :state, :default => "open"
      t.text :notes

      t.timestamps
    end

    add_index :appointments, :physician_id
    add_index :appointments, :patient_id
    add_index :appointments, :organization_id
  end
end
